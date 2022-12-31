RSpec.describe RSpec::Parameterized::TableSyntax do
  describe "table separated with pipe (using TableSyntax)" do
    using RSpec::Parameterized::TableSyntax

    where(:a, :b, :answer) do
      1         | 2         | 3
      "hello "  | "world"   | "hello world"
      [1, 2, 3] | [4, 5, 6] | [1, 2, 3, 4, 5, 6]
    end

    with_them do
      it "a plus b is answer" do
        expect(a + b).to eq answer
      end
    end
  end

  describe "table separated with pipe and lambda parameter (using TableSyntax)" do
    using RSpec::Parameterized::TableSyntax

    where(:a, :b, :matcher) do
      1         | 2         | -> { eq(3) }
      "hello "  | "world"   | -> { eq("hello world") }
      [1, 2, 3] | [4, 5, 6] | -> { be_a(Array) }
    end

    with_them do
      it "a plus b is answer" do
        expect(a + b).to instance_exec(&matcher)
      end
    end
  end

  context "when the table has only a row (using TableSyntax)" do
    using RSpec::Parameterized::TableSyntax

    where(:a, :b, :answer) do
      1         | 2         | 3
    end

    with_them do
      it "a plus b is answer" do
        expect(a + b).to eq answer
      end
    end
  end
  context "when 1st column is nil or true or false" do
    using RSpec::Parameterized::TableSyntax
    where(:a, :result) do
      nil   | nil
      false | false
      true  | true
    end

    with_them do
      it "a is result" do
        expect(a).to be result
      end
    end
  end

  context "when the where has let variables, defined by parent example group" do
    describe "parent (define let)" do
      let(:five) { 5 }
      let(:eight) { 8 }

      describe "child 3 (Using TableSyntax)" do
        using RSpec::Parameterized::TableSyntax

        where(:a, :b, :answer) do
          1         | 2         | 3
          five      | eight     | 13
        end

        with_them do
          it "a plus b is answer" do
            expect(a + b).to eq answer
          end
        end
      end
    end
  end
end
