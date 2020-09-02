(* 駅名の情報（漢字の駅名、ひらがなの駅名、ローマ字の駅名、所属する路線名）を表す型 *)
type ekimei_t = {
    kanji : string; (* 漢字の駅名 *)
    kana : string; (* ひらがなの駅名 *)
    romaji : string; (* ローマ字の駅名 *)
    shozoku : string; (* 所属する路線名 *)
}

(* 目的：ekimei_t 型のデータを受け取って、「路線名、駅名（かな）」の形式の文字列を返す *)
(* hyoji: ekimei_t -> string *)
let hyoji ekimei = match ekimei with
    {kanji = k1; kana = k2; romaji = r; shozoku = s} -> 
        s ^ "，" ^ k1 ^  "（" ^ k2 ^ "）"

(* ekimei_t 型のデータ例 *)
let ekimei1 = {kanji = "東京"; kana = "とうきょう"; romaji = "tokyo"; shozoku = "丸の内線"}
let ekimei2 = {kanji = "茗荷谷"; kana = "みょうがだに"; romaji = "myogadani"; shozoku = "丸の内線"}
let ekimei3 = {kanji = "大手町"; kana = "おおてまち"; romaji = "otemachi"; shozoku = "半蔵門線"}
let ekimei4 = {kanji = "有楽町"; kana = "ゆうらくちょう"; romaji = "yurakucho"; shozoku = "有楽町線"}

(* テスト *)
let test1 = hyoji ekimei1 = "丸の内線，東京（とうきょう）"
let test2 = hyoji ekimei2 = "丸の内線，茗荷谷（みょうがだに）"
let test3 = hyoji ekimei3 = "半蔵門線，大手町（おおてまち）"
let test4 = hyoji ekimei4 = "有楽町線，有楽町（ゆうらくちょう）"