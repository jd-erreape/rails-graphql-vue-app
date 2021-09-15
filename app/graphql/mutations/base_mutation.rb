# frozen_string_literal: true

module Mutations
  class BaseMutation < GraphQL::Schema::RelayClassicMutation
    ERROR_CODE = 'CLIENT_INPUT_ERROR'

    argument_class Types::BaseArgument
    field_class Types::BaseField
    input_object_class Types::BaseInputObject
    object_class Types::BaseObject

    # TODO: Spec, we'd need to mock the context and
    # verify the structure built is correct
    def build_errors(instance)
      instance.errors.map do |attr, message|
        context.add_error(
          GraphQL::ExecutionError.new(
            "#{instance[attr]} #{message}",
            extensions: { code: ERROR_CODE, attribute: attr }
          )
        )
      end
    end

    def with_error_check
      entity = yield

      return entity if entity.valid?

      # We need the return or the type
      # errors will be rescued and we'll
      # see a GraphQL error
      build_errors(entity) and return
    end
  end
end
