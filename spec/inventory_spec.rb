require_relative '../model/inventory'

RSpec.describe Inventory do 
  let(:inventory) {Inventory.new}

  describe "#lemons" do
    context "when the inventory is initialized" do
      it "will have 0 lemons" do
        expect(inventory.lemons).to eq 0
      end
    end

    context "when adding a lemon" do
      it "has 1 more lemon than before" do
        expect {
          inventory.add_lemons(1)
        }.to change {inventory.lemons}.by 1
      end
    end

    context "when adding a negative amount of lemons" do
      before do 
        inventory.add_lemons(10)
      end

      context "when the amount to remove is more than the inventory has" do
        it "raises exeption" do
          expect {
            inventory.add_lemons(-15)
          }.to raise_exception 
        end
        
        context "when the amount to remove is less than the inventory has" do
          it "has that many lemons removed" do
            expect {
              inventory.add_lemons(-5)
            }.to change{inventory.lemons}.by -5
          end
        end
      end
    end
  end

  describe "#sugar" do
    context "when the inventory is initilized" do
      it "will have 0 sugar" do
        expect(inventory.sugar).to eq 0
      end
    end

    context "when adding sugar" do
      context "when addin '1' sugar" do
        it "will have 1 more sugar than before" do
          expect {
            inventory.add_sugar(1)
          }.to change {inventory.sugar}.by 1
        end
      end
    end

    context "when adding a negative amount of sugar" do
      before do 
        inventory.add_sugar(10)
      end

      context "when the amount to remove is more than the inventory has" do
        it "raises exeption" do
          expect {
            inventory.add_sugar(-15)
          }.to raise_exception 
        end
        
        context "when the amount to remove is less than the inventory has" do
          it "has that many sugar removed" do
            expect {
              inventory.add_sugar(-5)
            }.to change{inventory.sugar}.by -5
          end
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
    end

    context "when deducting money" do
      context "with enough money in the inventory" do
        before do
          inventory.add_money(amount)
        end

        it "should remove the passed amount from dollars" do
          expect {
            inventory.add_money(-amount)
          }.to change{inventory.money}.by -amount
        end

        context "when charging a decimal amount" do
          it "should remove the decimal amount" do
            expect{
              inventory.add_money(-decimal_amount)
            }.to change{inventory.money}.by -decimal_amount
          end
        end
      end

      context "without enough money in the inventory" do
        it "an exception should be raised" do
          expect {
            inventory.add_money(2 * -amount)
          }.to raise_exception
        end
      end
    end
  end
end