(* 駅名の情報（漢字の駅名、ひらがなの駅名、ローマ字の駅名、所属する路線名）を表す型 *)
type ekimei_t = {
    kanji : string; (* 漢字の駅名 *)
    kana : string; (* ひらがなの駅名 *)
    romaji : string; (* ローマ字の駅名 *)
    shozoku : string; (* 所属する路線名 *)
}

let ekimei1 = {kanji = "東京"; kana = "とうきょう"; romaji = "tokyo"; shozoku = "丸の内線"}
let ekimei2 = {kanji = "茗荷谷"; kana = "みょうがだに"; romaji = "myogadani"; shozoku = "丸の内線"}
let ekimei3 = {kanji = "大手町"; kana = "おおてまち"; romaji = "otemachi"; shozoku = "半蔵門線"}
let ekimei4 = {kanji = "有楽町"; kana = "ゆうらくちょう"; romaji = "yurakucho"; shozoku = "有楽町線"}
