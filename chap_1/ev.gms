$title 等価変分（Equivalent Variation）について
$ontext
Time-stamp:     <2023-02-03 16:43:04 st>
First-written:  <2022-07-30>

このプログラムでチェックすること
+ 支出関数で定義する EV と間接効用関数で定義する EV が同じ値になること
+ 効用関数を単調変換しても、導かれる EV が同じであること

$offtext

*       --------------------------------------------------------------
*       集合の宣言・定義
set     i       Index of goods /
                agr     Agricultural goods
                man     Manufacturing goods
                ser     Services /;
*       iの中身を表示
display i;

*       iと同じ中身を持つjを宣言
alias(i,j);
display j;

*       --------------------------------------------------------------
*       パラメータの宣言
$ontext
外生的なパラメータ

+ 効用関数として Cobb-Douglas 型を仮定するので、その中のシェアパラメー
  タの値
$offtext
parameter
    alpha(i)    Share parameter in CD utility funtion
;
*       alphaに値を代入
alpha(i) = 1/3;
display alpha;

*       --------------------------------------------------------------
*       パラメータの宣言

set     s       State   /
        0       ショック前の状態
        1       ショック後の状態 /
;
parameters
    l_p(i,s)    Goods price
    l_m(s)      Income
    l_x(i,s)    Uncompensated demand
    l_h(i,s)    Compensated demand
    l_u(s)      Utility
    l_e(s)      Expenditure
;

*       まず、価格と所得を外生的に設定しておく
l_p(i,s) = uniform(0,1) * 10;
l_m("0") = 100;
l_m("1") = 120;
display l_p, l_m;

loop(s,

    l_x(i,s) = alpha(i) * l_m(s) / l_p(i,s);
    l_u(s) = l_m(s) * prod(i, (alpha(i)/l_p(i,s))**(alpha(i)));
    l_e(s) = l_u(s) * prod(i, (l_p(i,s)/alpha(i))**(alpha(i)));
    l_h(i,s) = alpha(i) * l_e(s) / l_p(i,s);

);

display l_x, l_u, l_e, l_h;

*       --------------------------------------------------------------
*       EV の計算
$ontext
EV は
+ exp: 支出関数で計算した EV
+ idu: 間接効用関数で計算した EV

$offtext

parameters
    l_ev          EV
;

*       まずは支出関数で計算する EV
l_ev("exp","u1") =
    l_u("1") * prod(i, (l_p(i,"0")/alpha(i))**(alpha(i)))
    - l_u("0") * prod(i, (l_p(i,"0")/alpha(i))**(alpha(i)))
    ;

*       次に間接効用関数で EV を計算するが、これは方程式を解く形で求める。

variables
    v_ev        EV を表す変数
;
equations
    e_v_ev      EV を決める式
;

*       式の定義
e_v_ev ..  (l_m("0") + v_ev) * prod(i, (alpha(i)/l_p(i,"0"))**(alpha(i)))
           =e= l_m("1") * prod(i, (alpha(i)/l_p(i,"1"))**(alpha(i)));

*       モデルの定義
model m_ev EV defined by indirect utility / e_v_ev.v_ev /;

v_ev.l = 0;

*       モデルを解く
solve m_ev using mcp;

l_ev("idu","u1") = v_ev.l;

*       EV を比較
display l_ev;

*       --------------------------------------------------------------
*       効用関数を変更した EV の計算
$ontext

これまでの効用関数（Cobb-Douglas型）の対数をとった関数を効用関数とし、
同じようにEVを計算する。

$offtext

loop(s,

    l_x(i,s) = alpha(i) * l_m(s) / l_p(i,s);
    l_u(s) = log(l_m(s) * prod(i, (alpha(i)/l_p(i,s))**(alpha(i))));
    l_e(s) = exp(l_u(s)) * prod(i, (l_p(i,s)/alpha(i))**(alpha(i)));
    l_h(i,s) = alpha(i) * l_e(s) / l_p(i,s);

);

display l_x, l_u, l_e, l_h;

*       ------------------------------------------------------------
*       EV の計算

*       支出関数を使った計算
l_ev("exp","u2") =
    exp(l_u("1")) * prod(i, (l_p(i,"0")/alpha(i))**(alpha(i)))
    - exp(l_u("0")) * prod(i, (l_p(i,"0")/alpha(i))**(alpha(i)))
    ;

equations
    e_v_ev_alt  EV を決める式（効用関数を変更したケース用）
;

e_v_ev_alt ..  log((l_m("0") + v_ev) * prod(i, (alpha(i)/l_p(i,"0"))**(alpha(i))))
           =e= log(l_m("1") * prod(i, (alpha(i)/l_p(i,"1"))**(alpha(i))));

model m_ev_alt EV defined by indirect utility / e_v_ev_alt.v_ev /;

v_ev.l = 1;

solve m_ev_alt using mcp;

l_ev("idu","u2") = v_ev.l;

*       EV の比較
option l_ev:6;
display l_ev;


* --------------------
* Local Variables:
* fill-column: 70
* coding: utf-8-dos
* End:
