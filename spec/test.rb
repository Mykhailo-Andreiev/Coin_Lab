require_relative '../coins'

RSpec.describe "Програма з монетами" do
  describe "#min_coins" do
    it "повертає правильну кількість монет для суми 11" do
      expect(min_coins([1, 5, 10], 11)).to eq([2, [10, 1]])
    end

    it "повертає -1, якщо неможливо скласти суму 3" do
      expect(min_coins([5, 10], 3)).to eq(-1)
    end

    it "повертає правильну кількість монет для суми 0" do
      expect(min_coins([1, 5, 10], 0)).to eq([0, []])
    end

    it "повертає -1 для від'ємної суми" do
      expect(min_coins([1, 5, 10], -5)).to eq(-1)
    end
  end

  describe "#run" do
    it "виводить мінімальну кількість монет для правильного введення суми" do
      allow_any_instance_of(Kernel).to receive(:gets).and_return("1", "11", "2")
      expect { run }.to output(/Мінімальна кількість монет: 2\nОбрані монети: 10\+1 = 11/).to_stdout
    end

    it "виводить помилку при введенні від'ємної суми" do
      allow_any_instance_of(Kernel).to receive(:gets).and_return("1", "-5", "2")
      expect { run }.to output(/Сума не може бути від'ємною. Спробуйте ще раз./).to_stdout
    end

    it "виводить повідомлення про завершення програми при виборі опції '2'" do
      allow_any_instance_of(Kernel).to receive(:gets).and_return("2")
      expect { run }.to output(/До побачення!/).to_stdout
    end

    it "виводить повідомлення про некоректну опцію" do
      allow_any_instance_of(Kernel).to receive(:gets).and_return("99", "2")
      expect { run }.to output(/Невірна опція, спробуйте ще раз./).to_stdout
    end
  end
end
