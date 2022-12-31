module RSpec
  module Parameterized
    module TableSyntax
      module TableSyntaxImplement
        def |(other)
          where_binding = binding.of_caller(1)          # get where block binding
          caller_instance = eval("self", where_binding) # get caller instance (ExampleGroup)

          if caller_instance.instance_variable_defined?(:@__parameter_table)
            table = caller_instance.instance_variable_get(:@__parameter_table)
          else
            table = RSpec::Parameterized::TableSyntax::Table.new
            caller_instance.instance_variable_set(:@__parameter_table, table)
          end

          row = Table::Row.new(self)
          table.add_row(row)
          row.add_param(other)
          table
        end
      end
    end
  end
end
