require "rails_helper"

describe 'db:populate', type: :task do
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

  context 'proceed with files' do
    let(:dir_path) { 'path/to/files/dir' }
    let(:populate_data) { double('new category with products') }
    let(:data) {
      {
        categories: ['Calculators', '...'],
        products: [
          {
                     category: 'Calculators',
                     name: 'Everplus Calculator Electronic',
                     image: 'image',
                     score:  0,
                     price:  0,
                     url: 'url'
          }
        ]
      }
    }

    before do
      allow(Category).to receive(:exists?).and_return(false)
      allow(TaskServices::JsonFilesParse).to receive(:get_content).with(dir_path).and_return(data)
      allow(TaskServices::PopulateData).to receive(:new).with(data).and_return(populate_data)
    end

    it 'with exists' do
      expect(populate_data).to receive(:write_in!).and_return(true)
      populate_data.write_in!
    end
  end


  # let(:csv)          { stub("csv data") }
  # let(:report)       { stub("generated report", :to_csv => csv) }
  # let(:user_records) { stub("user records for report") }


  # it "logs to stdout" do
  #   expect { task.execute }.to output("Sending invoices\n").to_stdout
  # end
  #
  # it "emails invoices" do
  #   subscriber = create(:subscriber)
  #
  #   task.execute
  #
  #   expect(subscriber).to have_received_invoice
  # end

  # it "checks in with Dead Mans Snitch" do
  #   dead_mans_snitch_request = stub_request(:get, "https://nosnch.in/c2354d53d2")
  #
  #   task.execute
  #
  #   expect(dead_mans_snitch_request).to have_been_requested
  # end
  #
  # matcher :have_received_invoice do
  #   match_unless_raises do |subscriber|
  #     expect(last_email_sent).to be_delivered_to subscriber.email
  #     expect(last_email_sent).to have_subject 'Your invoice'
  #   end
  # end

end

{ categories: ["Calculators",
   "Dresses", "Dominoes",
   "Electronics",
   "Xbox Ones",
   "Kayaks",
   "Boots",
   "Televisions",
   "TVs",
   "Desks",
   "iPhone 6 Cases",
   "Iphone 6s Cases",
   "Tablets",
   "Ups",
   "Nerfs",
   "Area Rugs",
   "Dictionaries",
   "Baby Alives",
   "TV Stands",
   "Watches",
   "Comforters",
   "Beddings",
   "Curtains",
   "Uninterruptible Power Supplies",
   "Headphones"],
 "products"=>
  [{"category"=>"Calculators",
    "name"=>"Texas Instruments TI-1795 SV Standard Function Calculator",
    "image"=>"https://images-na.ssl-images-amazon.com/images/I/51cpdDRBuAL._SL160_.jpg",
    "score"=>6.661807075487657,
    "name"=>"Texas Instruments TI-1795 SV Standard Function Calculator",
    "image"=>"https://images-na.ssl-images-amazon.com/images/I/51cpdDRBuAL._SL160_.jpg",
    "score"=>6.661807075487657,
    "price"=>9.43,
    "url"=>"https://www.amazon.com/Texas-Instruments-Standard-Function-Calculator/dp/B00000JBLU"},
   {"category"=>"Calculators",
    "name"=>"Everplus Calculator Electronic Desktop Calculator with 12 Digit Large Display, Solar Battery LCD",
    "image"=>"https://images-na.ssl-images-amazon.com/images/I/51kwPtKY9-L._SL160_.jpg",
    "score"=>3.5241147352194506,
    "price"=>9.99,
    "url"=>"https://www.amazon.com/Everplus-Calculator-Electronic-Desktop-Battery/dp/B01JYN4928"},
   {"category"=>"Calculators",
    "name"=>"Office+Style 8 Digit Dual Powered Desktop Calculator, LCD Display, Green",
    "image"=>"https://images-na.ssl-images-amazon.com/images/I/51v7IXq%2BLcL._SL160_.jpg",
    "score"=>0.0362804519169615,
    "price"=>7.99,
    "url"=>"https://www.amazon.com/Office-Style-Powered-Desktop-Calculator/dp/B00J1VB2WO"},
   {"category"=>"Calculators",
    "name"=>"Calculator, Helect Standard Function Desktop Calculator - H1001",
    "image"=>"https://images-na.ssl-images-amazon.com/images/I/516WztGfcQL._SL160_.jpg",
    "score"=>6.8855811052428395,
    "price"=>8.99,
    "url"=>"https://www.amazon.com/Calculator-Helect-Standard-Function-Desktop/dp/B01B5MU6JG"},
   {"category"=>"Calculators",
    "name"=>"Texas Instruments Fundamental, Two-Line Scientific Calculator, Blue (30XIIS/TBL/1L1/BA)",
    "image"=>"https://images-na.ssl-images-amazon.com/images/I/51E69T29Z%2BL._SL160_.jpg",
    "score"=>4.612122066256716,
    "price"=>8.5,
    "url"=>"https://www.amazon.com/Texas-Instruments-30XIIS-TBL-1L1/dp/B008HYSAF8"},
   {"category"=>"Calculators",
    "name"=>"Calculator, Helect Business Standard Function Desktop Calculator - Silver",
    "image"=>"https://images-na.ssl-images-amazon.com/images/I/5183aOcdR3L._SL160_.jpg",
    "score"=>0.4508750120299083,
    "price"=>9.99,
    "url"=>"https://www.amazon.com/Calculator-Helect-Business-Standard-Function/dp/B07413FM47"},
   {"category"=>"Calculators",
    "name"=>"Calculator, KDT Handheld Standard Function Desktop Calculators , Solar Battery LCD Display Office",
    "image"=>"https://images-na.ssl-images-amazon.com/images/I/51JgEl3CbhL._SL160_.jpg",
    "score"=>3.588917928269926,
    "price"=>14.99,
    "url"=>"https://www.amazon.com/Calculator-KDT-Handheld-Standard-Calculators/dp/B07552Y3WQ"},
   {"category"=>"Calculators",
    "name"=>"Casio Inc. HR-100TM mini desktop printing Calculator",
    "image"=>"https://images-na.ssl-images-amazon.com/images/I/51T9yAKRpxL._SL160_.jpg",
    "score"=>1.691534216281489,
    "price"=>23.62,
    "url"=>"https://www.amazon.com/Casio-HR-100TM-desktop-printing-Calculator/dp/B000I3C4EY"},
   {"category"=>"Calculators",
    "name"=>"Texas Instruments TI-34 MultiView Scientific Calculator",
    "image"=>"https://images-na.ssl-images-amazon.com/images/I/51iXcno2KtL._SL160_.jpg",
    "score"=>2.4556369960750564,
    "price"=>14.0,
    "url"=>"https://www.amazon.com/Texas-Instruments-MultiView-Scientific-Calculator/dp/B001A4G1TY"},
   {"category"=>"Dresses",
    "name"=>"Unbranded* Women's Casual Plain Simple T-shirt Loose Pocket Dress With Pockets Wine Red",
    "image"=>"https://images-na.ssl-images-amazon.com/images/I/41jyR9L6YgL._SL160_.jpg",
    "score"=>6.00561369438774,
    "price"=>18.99,
    "url"=>"https://www.amazon.com/Unbranded-Womens-T-shirt-Pockets-X-Large/dp/B07552HZWK"},
   {"category"=>"Dresses",
    "name"=>"Eliacher Women's Deep V Neck Adjustable Spaghetti Straps Summer Dress Sleeveless Sexy Backless",
    "image"=>"https://images-na.ssl-images-amazon.com/images/I/41Deq6%2BhsLL._SL160_.jpg",
    "score"=>5.680310412040311,
    "price"=>23.87,
    "url"=>"https://www.amazon.com/Eliacher-Adjustable-Spaghetti-Sleeveless-Backless/dp/B075KF99MV"},
   {"category"=>"Dresses",
    "name"=>"Women's Long Sleeve Casual Loose T-Shirt Dress Brown L",
    "image"=>"https://images-na.ssl-images-amazon.com/images/I/41nEa37G37L._SL160_.jpg",
    "score"=>0.27670525209669206,
    "price"=>16.99,
    "url"=>"https://www.amazon.com/Womens-Sleeve-Casual-Loose-T-Shirt/dp/B074R9WDJD"},
   {"category"=>"Dresses",
    "name"=>"oxiuly Women's Vintage Patchwork Pockets Puffy Swing Casual Party Dress OX165",
    "image"=>"https://images-na.ssl-images-amazon.com/images/I/51s36JeOLpL._SL160_.jpg",
    "score"=>4.663263333195699,
    "price"=>29.96,
    "url"=>"https://www.amazon.com/oxiuly-Womens-Vintage-Patchwork-Pockets/dp/B075CHZGNN"},
   {"category"=>"Dresses",
    "name"=>"Dearlove Women's Sexy V neck Cold Shoulder Short Sleeve Maxi Dress Split Formal",
    "image"=>"https://images-na.ssl-images-amazon.com/images/I/41czd1bCTcL._SL160_.jpg",
    "score"=>0.21196583805004365,
    "price"=>19.99,
    "url"=>"https://www.amazon.com/Dearlove-Womens-Shoulder-Sleeve-Evening/dp/B075175J47"},
   {"category"=>"Dresses",
    "name"=>"Heloise Women's A-Line Sleeveless Pleated Little Wine Red Cocktail Party Dress With Floral",
    "image"=>"https://images-na.ssl-images-amazon.com/images/I/31czoFjomTL._SL160_.jpg",
    "score"=>6.30764092400028,
    "price"=>22.99,
    "url"=>"https://www.amazon.com/Heloise-Womens-Sleeveless-Pleated-Cocktail/dp/B06XGB2LJS"},
   {"category"=>"Dresses",
    "name"=>"ZESICA Women's Long Sleeve Floral Pockets Casual Swing Pleated T-shirt Dress Olive XX-Large",
    "image"=>"https://images-na.ssl-images-amazon.com/images/I/51JjDP6qkBL._SL160_.jpg",
    "score"=>2.617631100087957,
    "price"=>19.99,
    "url"=>"https://www.amazon.com/ZESICA-Pockets-Pleated-T-shirt-XX-Large/dp/B07565329H"},
   {"category"=>"Dresses",
    "name"=>"Missmay Women's Vintage Floral Lace Long Sleeve Boat Neck Cocktail Formal Swing Dress",
    "image"=>"https://images-na.ssl-images-amazon.com/images/I/51AKUvzp8bL._SL160_.jpg",
    "score"=>4.687587413054464,
    "price"=>39.99,
    "url"=>"https://www.amazon.com/Missmay-Womens-Vintage-Floral-Cocktail/dp/B01LZPTG28"},
   {"category"=>"Dresses",
    "name"=>"Mixfeer Women's Vintage Floral Lace Cocktail Swing Dress With 3/4 Sleeve",
    "image"=>"https://images-na.ssl-images-amazon.com/images/I/417Q0Kwr5FL._SL160_.jpg",
    "score"=>6.82196121642935,
    "price"=>23.99,
    "url"=>"https://www.amazon.com/Mixfeer-Womens-Vintage-Floral-Cocktail/dp/B075XKB46K"},
   {"category"=>"Dresses",
    "name"=>"Sidefeel Women Off Shoulder Short Sleeve High Low Skater Dress Medium Black",
    "image"=>"https://images-na.ssl-images-amazon.com/images/I/41-jRQuFzTL._SL160_.jpg",
    "score"=>5.917358450119736,
    "price"=>19.99,
    "url"=>"https://www.amazon.com/Sidefeel-Shoulder-Sleeve-Skater-Medium/dp/B01MDUARMW"},
   {"category"=>"Dresses",
    "name"=>"QIXING Women's Long Sleeve Cold Shoulder Casual Loose Swing Dress Wine Red-L",
    "image"=>"https://images-na.ssl-images-amazon.com/images/I/41G0Wakfs%2BL._SL160_.jpg",
    "score"=>1.4905488118432253,
    "price"=>16.99,
    "url"=>"https://www.amazon.com/QIXING-Womens-Sleeve-Shoulder-Casual/dp/B0759JSDT1"},
   {"category"=>"Dresses",
    "name"=>"HOMEYEE Women's Retro Chic Colorblock Lapel Career Tunic Dress B238 (L, Gray)",
    "image"=>"https://images-na.ssl-images-amazon.com/images/I/41Kbk1Bs--L._SL160_.jpg",
    "score"=>6.285754046920514,
    "price"=>25.99,
    "url"=>"https://www.amazon.com/HOMEYEE-Womens-Retro-Colorblock-Career/dp/B076FS7XKS"},
   {"category"=>"Dominoes",
    "name"=>"Domino Rally Racing — Dominoes for Kids — STEM-based Learning Set",
    "image"=>"https://images-na.ssl-images-amazon.com/images/I/51ujGBjfFDL._SL160_.jpg",
    "score"=>2.9206595807049665,
    "price"=>25.5,
    "url"=>"https://www.amazon.com/Domino-Rally-Racing-Dominoes-STEM-based/dp/B006ZKQ846"},
   {"category"=>"Dominoes",
    "name"=>"|200 Pcs| Bucket of Domino Authentic Basswood Standard Wooden Dominoes Building Blocks Kids",
    "image"=>"https://images-na.ssl-images-amazon.com/images/I/51mXelo58DL._SL160_.jpg",
    "score"=>0.7555241329943139,
    "price"=>16.95,
    "url"=>"https://www.amazon.com/Authentic-Basswood-Standard-Dominoes-Building/dp/B01JMVEUY4"},
   {"category"=>"Dominoes",
    "name"=>"Dominoes Set- 28 Piece Double-Six Ivory Domino Tiles Set, Classic Numbers Table Game",
    "image"=>"https://images-na.ssl-images-amazon.com/images/I/51IYn9GscOL._SL160_.jpg",
    "score"=>0.47226274664753287,
    "price"=>12.97,
    "url"=>"https://www.amazon.com/Dominoes-Double-Six-Carrying-Hey-Play/dp/B002TFHOEO"},
   {"category"=>"Dominoes",
    "name"=>"Ideal Solid Wood Domino Trays",
    "image"=>"https://images-na.ssl-images-amazon.com/images/I/51ik7wGsdnL._SL160_.jpg",
