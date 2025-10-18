
First-written:	<2017/03/03>
Time-stamp:	<2023-04-28 15:38:33 st>

--------------------------------------------------------------------------

* ファイルの説明

+ README.txt
  + このファイルです。

+ chapter_12_SAM_example.xlsx
  + SAM のデータのファイルです。

+ chapter_12_SAM_example.gdx

+ data_create.gms
  + GAMS 用の SAM のデータを作成するプログラムです。
  + まず、これを実行してください。

+ one_region.gms
  + メインのシミュレーションのファイル

+ one_region_cet.gms
  + 輸出財と国内財が完全代替のケース

+ one_region_alt.gms
  + 所得の一定率を海外へ投資（貯蓄）するケース

+ one_region_tot.gms
  + 交易条件を変化させるシミュレーションをおこなうプログラム

+ export_excel.gms
  +  結果を chapter_12_results.xlsx に出力するためのプログラムです。

+ chapter_12_results.xlsx
  +  結果を出力するためのファイルです。


* 実行方法

** Step 1

+ まず、data_create.gms を実行して、エクセルファイルからGDX ファイルを作成します。

** Step 2

+ シミュレーションのプログラムである。
  + one_region.gms: モデルのファイル
  + one_region_cet.gms: モデルのファイル
  + one_region_alt.gms: モデルのファイル
  + one_region_tot.gms: モデルのファイル
  を実行します。

** Step 3

+ 結果をエクセルファイルに出力するには export_excel.gms を実行します。
+ 結果は chapter_12_results.xlsx に出力されます。







--------------------
Local Variables:
mode: org
coding: utf-8
fill-column: 80
End:
