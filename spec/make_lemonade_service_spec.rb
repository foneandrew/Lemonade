require_relative '../service/make_lemonade_service'

RSpec.describe MakeLemonadeService do
  let(:inventory) {Inventory.new}
  let(:service) {MakeLemonadeService.new(inventory)}

  describe "#call" do
    let(:num_cups) {5}
    context "when the inventory has enough ingredients" do
      before do
        inventory.add_lemons(num_cups * 2)
        inventory.add_sugar(num_cups * 2)
      end

      context "when adding cups" do
        it "returns true" do
          expect(service.call(num_cups)).to eq true
        end

        it "adds the right amount of cups" do
          service.call(num_cups)
          expect(inventory.cups).to eq num_cups
        end

        it "removes the right amount of lemons" do
          expect {
            service.call(num_cups)
          }.to change{inventory.lemons}.by -num_cups
        end

        it "removes the right amount of sugar" do
          expect {
            service.call(num_cups)
          }.to change{inventory.sugar}.by -num_cups
        end
      end
    end

    context "when the inventory does not have the correct ingredients:" do
      before do
        inventory.add_lemons(num_cups)
        inventory.add_sugar(num_cups)
      end

      context "if there is not enough sugar" do
        before do
          inventory.remove_sugar(1)
        end

        it "returns false" do
          expect(service.call(num_cups)).to eq false
        end

        it "does remove any lemons" do
          expect{
            service.call(num_cups)
          }.to change{inventory.lemons}.by 0
        end

        it "does remove any sugar" do
          expect{
            service.call(num_cups)
          }.to change{inventory.sugar}.by 0
        end

        it "does add any cups" do
          expect{
            service.call(num_cups)
          }.to change{inventory.cups}.by 0
        end
      end

      context "if there are not enough lemons" do
        before do
          inventory.remove_lemons(1)
        end

        it "returns false" do
          expect(service.call(num_cups)).to eq false
        end

        it "does remove any lemons" do
          expect{
            service.call(num_cups)
          }.to change{inventory.lemons}.by 0
        end

        it "does remove any sugar" do
          expect{
            service.call(num_cups)
          }.to change{inventory.sugar}.by 0
        end

        it "does add any cups" do
          expect{
            service.call(num_cups)
          }.to change{inventory.cups}.by 0
        end
      end

      context "if there are not enough of both ingredients" do
        before do
          inventory.remove_lemons(1)
          inventory.remove_sugar(1)
        end

        it "returns false" do
          expect(service.call(num_cups)).to eq false
        end

        it "does remove any lemons" do
          expect{
            service.call(num_cups)
          }.to change{inventory.lemons}.by 0
        end

        it "does remove any sugar" do
          expect{
            service.call(num_cups)
          }.to change{inventory.sugar}.by 0
        end

        it "does add any cups" do
          expect{
            service.call(num_cups)
          }.to change{inventory.cups}.by 0
        end
      end
    end
  end
end