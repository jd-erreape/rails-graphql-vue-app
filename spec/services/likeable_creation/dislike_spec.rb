# frozen_string_literal: true

require 'spec_helper'
require_relative './shared_examples'

describe LikeableCreation::Dislike do
  it_behaves_like 'a likeable creation entity', 'like', 'dislike'
end
