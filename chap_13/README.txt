
First-written:	<2017/03/03>
Time-stamp:	<2023-04-28 15:37:39 st>

--------------------------------------------------------------------------

* ファイルの説明

+ README.txt: 
  + このファイルです。

+ chapter_13_SAM_example.xlsx
  + SAM のデータのファイルです。
  + inv_model_a.gms と inv_model_b.gms で使う二つの SAM が入っています。

+ chapter_13_SAM_example_B.gdx

+ data_create_B.gms
  + inv_model_b.gms 用のデータを作成するためのプログラムです。
  + inv_model_b.gms を実行する前にこれを実行してください。

+ inv_model_a.gms
  + 貿易のないモデルです。

+ inv_model_b.gms
  + 貿易のあるモデルです。

+ export_excel.gms
  + 計算結果を chapter_13_results.xlsx に出力するためのプログラムです。

+ chapter_13_results.xlsx
  + 計算結果を出力する先です。

* 実行方法

** Step 1

+ まず、data_create_A.gms と data_create_B.gms を実行して、エクセルファイルから
  GDX ファイルを作成します。

** Step 2

+ シミュレーションのプログラムである。
  + inv_model_A.gms
  + inv_model_B.gms
  を実行します。

** Step 3

+ 結果をエクセルファイルに出力するには export_excel.gms を実行します。
+ 結果は chapter_13_results.xlsx に出力されます。







--------------------
Local Variables:
mode: org
coding: utf-8
fill-column: 80
End:
