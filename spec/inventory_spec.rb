require_relative '../model/inventory'

RSpec.describe Inventory do 
  let(:inventory) {Inventory.new}

  describe "#lemons" do
    context "when the inventory is initialized" do
      it "will have 0 lemons" do
        expect(inventory.lemons).to eq 0
      end
    end

    context "when adding lemons" do
      context "when adding a positive amount of lemons" do
        it "has 1 more lemon than before" do
          expect {
            inventory.add_lemons(1)
          }.to change {inventory.lemons}.by 1
        end
      end

      context "when adding a negative amount of lemons" do
        it "raises an error" do
          expect {
            inventory.add_lemons(-1)
          }.to raise_exception
        end
      end
    end

    context "when removing lemons" do
      let(:num_lemons) {5}
      before do
        inventory.add_lemons(2 * num_lemons)
      end

      context "when removing a positive amount of lemons" do
        context "when there is enough lemons to remove" do
          it "will have that many less lemons" do
            expect {
              inventory.remove_lemons(num_lemons)
            }.to change {inventory.lemons}.by -num_lemons
          end
        end

        context "when there isnt enough lemons to remove" do
          it "raises an error" do
            expect {
              inventory.remove_lemons(num_lemons * 3)
            }.to raise_exception
          end
        end
      end

      context "when removing a negative number of lemons" do
        it "raises an error" do
          expect {
            inventory.remove_lemons(-num_lemons)
          }.to raise_exception
        end
      end
    end
  end

  describe "#sugar" do
    context "when the inventory is initialized" do
      it "will have 0 sugar" do
        expect(inventory.sugar).to eq 0
      end
    end

    context "when adding sugar" do
      context "when adding a positive amount of sugar" do
        it "has 1 more lemon than before" do
          expect {
            inventory.add_sugar(1)
          }.to change {inventory.sugar}.by 1
        end
      end

      context "when adding a negative amount of sugar" do
        it "raises an error" do
          expect {
            inventory.add_sugar(-1)
          }.to raise_exception
        end
      end
    end

    context "when removing sugar" do
      let(:num_sugar) {5}
      before do
        inventory.add_sugar(2 * num_sugar)
      end

      context "when removing a positive amount of sugar" do
        context "when there is enough sugar to remove" do
          it "will have that many less sugar" do
            expect {
              inventory.remove_sugar(num_sugar)
            }.to change {inventory.sugar}.by -num_sugar
          end
        end

        context "when there isnt enough sugar to remove" do
          it "raises an error" do
            expect {
              inventory.remove_sugar(num_sugar * 3)
            }.to raise_exception
          end
        end
      end

      context "when removing a negative number of sugar" do
        it "raises an error" do
          expect {
            inventory.remove_sugar(-num_sugar)
          }.to raise_exception
        end
      end
    end
  end

  describe "#cups" do
    context "when the inventory is initilized" do
      it "will have 0 cups" do
        expect(inventory.cups).to eq 0
      end
    end

    context "when setting cups" do
      context "when setting a positive amount" do
        let(:cup_amount) {10}
        
        it "has the new amount of cups that were passed" do
          inventory.cups = cup_amount
          expect(inventory.cups).to eq cup_amount
        end
      end

      context "when setting a negative amount" do
        it "raises an exception" do
          expect{
            inventory.cups = -10
          }.to raise_exception
        end
      end
    end
  end

  describe "#dollars" do
    let (:amount) {10}
    let (:decimal_amount) {5.64}

    context "when inventory initilized" do
      it "dollars should be 0" do
        expect(inventory.money).to eq 0
      end
    end

    context "when adding money" do
      it "money will increase by the given amount" do
        expect {
          inventory.add_money(amount)
        }.to change{inventory.money}.by 10
      end

      context "when adding a decimal number" do
        it "money should increase by the same decimal amount" do
          expect {
            inventory.add_money(decimal_amount)
          }.to change{inventory.money}.by decimal_amount
        end
      end

      context "when adding a negative amount of money" do
        it "raises an exception" do
          expect{
            inventory.add_money(-amount)
          }.to raise_exception
        end
      end
    end

    context "when deducting money" do
      context "with enough money in the inventory" do
        before do
          inventory.add_money(amount)
        end

        it "should remove the passed amount from dollars" do
          expect {
            inventory.remove_money(amount)
          }.to change{inventory.money}.by -amount
        end

        context "when charging a decimal amount" do
          it "should remove the decimal amount" do
            expect{
              inventory.remove_money(decimal_amount)
            }.to change{inventory.money}.by -decimal_amount
          end
        end
      end

      context "when removing a negative amount of money" do
        it "raises an exception" do
          expect{
            inventory.remove_money(-amount)
          }.to raise_exception
        end
      end

      context "without enough money in the inventory" do
        it "an exception should be raised" do
          expect {
            inventory.remove_money(2 * amount)
          }.to raise_exception
        end
      end
    end
  end
end