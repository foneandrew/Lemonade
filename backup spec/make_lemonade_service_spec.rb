require_relative '../service/make_lemonade_service'

RSpec.describe MakeLemonadeService do
  let(:inventory) {instance_double("Inventory")}
  let(:service) {MakeLemonadeService.new(inventory)}

  describe "#call" do
    let(:num_cups) {5}
    context "when the inventory has enough ingredients" do
      context "when adding cups" do
        before do
          allow(inventory).to receive_messages(
            :cups= => nil,
            :remove_sugar => nil,
            :remove_lemons => nil)
          expect(inventory).to receive(:sugar).and_return(num_cups * 2)
          expect(inventory).to receive(:lemons).and_return(num_cups * 2)
        end

        it "returns true" do
          expect(service.call(num_cups)).to eq true
        end

        it "adds the right amount of cups" do
          expect(inventory).to receive(:cups=).with(num_cups)
          service.call(num_cups)
        end

        it "removes the right amount of lemons" do
          expect(inventory).to receive(:remove_lemons).with(num_cups)
          service.call(num_cups)
        end

        it "removes the right amount of sugar" do
          expect(inventory).to receive(:remove_sugar).with(num_cups)
          service.call(num_cups)
        end
      end
    end

    context "when the inventory does not have the correct ingredients:" do
      before do
        allow(inventory).to receive_messages(
          :remove_lemons => nil)
        allow(inventory).to receive(:sugar).and_return(num_cups)
        allow(inventory).to receive(:lemons).and_return(num_cups)
      end

      context "if there is not enough sugar" do
        before do
          allow(inventory).to receive(:sugar).and_return(num_cups - 1)
        end

        it "returns false" do
          expect(service.call(num_cups)).to eq false
        end
      end

      context "if there is not enough lemons" do
        before do
          allow(inventory).to receive(:lemons).and_return(num_cups - 1)
        end

        it "returns false" do
          expect(service.call(num_cups)).to eq false
        end
      end

      context "if there is not enough of either ingredient" do
        before do
          allow(inventory).to receive(:sugar).and_return(num_cups - 1)
          allow(inventory).to receive(:lemons).and_return(num_cups - 1)
        end

        it "returns false" do
          expect(service.call(num_cups)).to eq false
        end
      end
    end
  end
end