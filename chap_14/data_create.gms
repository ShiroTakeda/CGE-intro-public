$title データを作成するためのプログラム
$ontext
Time-stamp:     <2023-04-30 00:23:55 st>
First-written:  <2014/03/15>

+ gov_model_A.gms と gov_model_B.gms で利用するデータを作成するプログラム。
+ chap_14_SAM_example.xlsx から chap_14_SAM_example.gdx を作成する。

$offtext

*       以下は command.txt というファイルに $onecho ~ $offecho に囲まれ
*       た内容を出力するという命令。
$onecho > command.txt
i=chap_14_SAM_example.xlsx
o=chap_14_SAM_example.gdx
par=SAM rng=SAM_14!B3:R19 rdim=2 cdim=2
$offecho

*       以下は、command.txt の内容を引数として gdxxrw.exe を実行するとい
*       う命令。「=」付きは実行が終わるまで次の命令にはうつらないとい
*       う指定。
execute '=gdxxrw @command.txt';



* --------------------
* Local Variables:
* fill-column: 70
* coding: utf-8-dos
* End:
