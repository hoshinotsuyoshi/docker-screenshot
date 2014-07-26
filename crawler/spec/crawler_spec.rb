require 'spec_helper'

describe Crawler do
  describe '.Start' do
    context 'when LIMIT is 3' do
      it 'calls Crawler.run 3 times' do
        stub_const('Crawler::INTERVAL', 0)
        stub_const('Crawler::LIMIT', 3)
        allow(Crawler).to receive(:run).exactly(3)
        Crawler.Start
      end
    end
  end

  describe '.run' do
    it 'calls Crawler#run' do
      allow_any_instance_of(Crawler).to receive(:run)
      allow_any_instance_of(Crawler).to receive(:shot_all)
      Crawler.run
    end
  end

  describe '#run' do
    let(:chat) do
      File.read('spec/fixtures/chat.html')
    end

    it "returns all rooms' URL & name" do
      WebMock.stub_request(:get, 'http://www.dmm.co.jp/live/chat/').to_return(body: chat, status: 200, headers: {content_type: 'text/html'})
      expected =
        [
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=706911/", :name=>"～☆みるく☆～"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=706891/",:name=>"めぐみ☆★"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=706490/",:name=>"♪フル"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=706571/",:name=>"＊えりこ＋。"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=705833/",:name=>"涼音 かおり"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=705853/",:name=>"めい☆ミ"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=706488/",:name=>"☆レミナ"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=706495/",:name=>"みか//"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=707003/",:name=>"★★ミカ★★"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=707388/",:name=>"かなchan"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=706871/",:name=>"かーゆ"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=707077/",:name=>"*☆ま な☆彡"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=706385/",:name=>"まひろ *"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=650507/",:name=>"綾華"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=660784/",:name=>"*lotta*"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=665987/",:name=>"*ひかる*"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=671054/",:name=>"TAO☆"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=679567/",:name=>"。○ゆきりん○。"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=680717/",:name=>"ピッコロ"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=688990/",:name=>"まい (^―^)"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=689814/",:name=>"★*･*なち*･☆*"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=696845/",:name=>"魔女。"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=696910/",:name=>"さ き。"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=698792/",:name=>"☆☆まなちん☆☆"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=700125/",:name=>"きえ(・ω・)ノ"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=632679/",:name=>"☆りお★りお☆"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=678715/",:name=>"。＋あみ＋。"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=697889/",:name=>"mizuha"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=702825/",:name=>"＊やよい＊"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=704753/",:name=>"♪あいり///"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=705168/",:name=>"ほのか。。。♪"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=705426/",:name=>"★れおな★"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=598538/",:name=>"・*あむ*．"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=686005/",:name=>"☆マリア**☆"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=686460/",:name=>"+♪みほ♪+"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=698412/",:name=>"Merly"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=700075/",:name=>"＊ゆ な＊"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=703020/",:name=>"♪さやこ♪"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=704060/",:name=>"☆§みゆき§☆"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=616799/",:name=>"氷高-ひだか-"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=631796/",:name=>"◎ れ な ◎"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=643278/",:name=>"。＋ひなた＋。"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=661877/",:name=>"*☆にいな☆*"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=664345/",:name=>"ｖまゆ"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=682223/",:name=>"Tata"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=702157/",:name=>"きよか"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=705032/",:name=>"☆なな♪/☆"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=601532/",:name=>"まりりん★★★"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=633998/",:name=>"＊ のあな ＊"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=668938/",:name=>"まろん＊。"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=694335/",:name=>"☆アオイ★☆"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=699587/",:name=>"*Silvia*"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=702235/",:name=>"あやな。＋＋"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=705311/",:name=>"あびぃ"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=678704/",:name=>"∞あんず∞"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=692462/",:name=>"なみ*♪"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=693529/",:name=>"＊☆ あ い ☆＊"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=701469/",:name=>"ＭあすかＭ."},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=705056/",:name=>"*Rui*"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=635401/",:name=>"ゆ-み"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=680035/",:name=>"まどかちゃん"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=688699/",:name=>"ゆこ＊＊"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=702542/",:name=>"(しおん˘ω˘*)"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=704727/",:name=>"**ゆき☆"},
          {:url=>"http://www.dmm.co.jp/live/chat/-/chat-room/=/character_id=704954/",:name=>"ＨＡＩＪＩ"}]
        expect(Crawler.new.run).to eq(expected)
    end
  end
end
