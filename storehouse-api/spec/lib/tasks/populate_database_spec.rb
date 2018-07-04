require "rails_helper"

describe 'db:populate', type: :task do
  let(:data) {
    {
      "categories" => ['Calculators', 'Dresses', 'Dominoes'],
      "products" =>
        [
           {
              "category" => 'Calculators',
              "name" => 'Texas Instruments TI-1795 SV Standard Function Calculator',
              "image" => 'https://images-na.ssl-images-amazon.com/images/I/51cpdDRBuAL._SL160_.jpg',
              "score" => 6.661807075487657,
              "price" => 9.43,
              "url" => 'https://www.amazon.com/Texas-Instruments-Standard-Function-Calculator/dp/B00000JBLU'
           },
           {
              "category" => 'Dresses',
              "name" => 'Sidefeel Women Off Shoulder Short Sleeve High Low Skater Dress Medium Black',
              "image" => 'https://images-na.ssl-images-amazon.com/images/I/41-jRQuFzTL._SL160_.jpg',
              "score" => 5.917358450119736,
              "price" => 19.99,
              "url" => 'https://www.amazon.com/Sidefeel-Shoulder-Sleeve-Skater-Medium/dp/B01MDUARMW'
           },
           {
              "category" => 'Dominoes',
              "name" => 'Dominoes Set- 28 Piece Double-Six Ivory Domino Tiles Set, Classic Numbers Table Game',
              "image" => 'https://images-na.ssl-images-amazon.com/images/I/51IYn9GscOL._SL160_.jpg',
              "score" => 0.47226274664753287,
              "price" => 12.97,
              "url" => 'https://www.amazon.com/Dominoes-Double-Six-Carrying-Hey-Play/dp/B002TFHOEO'
           }
        ]
    }
  }

  context 'when Category table is filled' do
    before do
      allow(Category).to receive(:exists?).and_return(true)
    end

    it 'with exists' do
      expect { task.execute }.to output("Database has already populated\n").to_stdout
    end
  end

  context 'when Category table is empty' do
    before do
      allow(Category).to receive(:exists?).and_return(false)
    end

    it 'with exists' do
      expect { task.execute }.to output("All categories and products were created\n").to_stdout
    end

    it 'preloads the Rails environment' do
      expect(task.prerequisites).to include 'environment'
    end

    it 'runs with no errors' do
      expect { task.execute }.not_to raise_error
    end
  end

  context 'write parsed data' do
    let(:dir_path) { 'path/to/files/dir' }
    let(:populate_data) { double('new category with products') }

    before do
      allow(Category).to receive(:exists?).and_return(false)
      allow(TaskServices::JsonFilesParse).to receive(:get_content).with(dir_path).and_return(data)
      allow(TaskServices::PopulateData).to receive(:new).with(data).and_return(populate_data)
    end

    it 'with write_in!' do
      expect(populate_data).to receive(:write_in!).and_return(true)
      populate_data.write_in!
    end
  end

  context 'data stored in database' do
    let(:subject) { TaskServices::PopulateData.new(data) }

    before do
      allow(TaskServices::JsonFilesParse).to receive(:get_content).with("#{Rails.root}/#{ENV['DATA_FILES_DIR']}").and_return(data)
      allow(TaskServices::PopulateData).to receive(:new).with(data).and_return(subject)
    end

    it 'data present in database' do
      subject.write_in!
      expect(Category.exists?).to be_truthy
    end
  end
end
