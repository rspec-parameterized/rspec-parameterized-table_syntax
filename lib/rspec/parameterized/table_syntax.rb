# frozen_string_literal: true

require "rspec/parameterized/table_syntax/version"
require 'rspec/parameterized/table_syntax/table'
require 'rspec/parameterized/table_syntax/table_syntax_implement'
require "rspec/parameterized/core"
require 'binding_of_caller'

module RSpec
  module Parameterized
    module TableSyntax
      if Gem::Version.create(RUBY_VERSION) >= Gem::Version.create('3.1.0')
        refine Object do
          import_methods TableSyntaxImplement
        end

        refine Integer do
          import_methods TableSyntaxImplement
        end

        refine Array do
          import_methods TableSyntaxImplement
        end

        refine NilClass do
          import_methods TableSyntaxImplement
        end

        refine TrueClass do
          import_methods TableSyntaxImplement
        end

        refine FalseClass do
          import_methods TableSyntaxImplement
        end
      else
        refine Object do
          include TableSyntaxImplement
        end

        refine Integer do
          include TableSyntaxImplement
        end

        refine Array do
          include TableSyntaxImplement
        end

        refine NilClass do
          include TableSyntaxImplement
        end

        refine TrueClass do
          include TableSyntaxImplement
        end

        refine FalseClass do
          include TableSyntaxImplement
        end
      end
    end
  end
end
