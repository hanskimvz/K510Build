	nncase ir1.7.1:Ø!
ù
Concat_40(Concat)_NCHW
"Conv_41(Conv)_load_data/const_loadConv_41(Conv)_load_dataConv_41(Conv)_load_data"GNNELoad*
module_typeJk510*
actionJtrue
Ω
+Conv_41(Conv)_load_weights/weights_constant
'Conv_41(Conv)_load_weights/load_weightsConv_41(Conv)_load_weightsConv_41(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
_Conv_41(Conv)/psumConv_41(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
r
Conv_41(Conv)/actConv_41(Conv)_load_actConv_41(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
°
(Conv_41(Conv)_load_data/const_load/const"Conv_41(Conv)_load_data/const_load"Conv_41(Conv)_load_data/const_load"GNNELoad*
module_typeJk510*
actionJtrue
∂
3Conv_41(Conv)_load_weights/weights_constant/ptq_deq'Conv_41(Conv)_load_weights/load_weights'Conv_41(Conv)_load_weights/load_weights"GNNELoad*
module_typeJk510*
actionJtrue
Ö
Conv_41(Conv)Sigmoid_42.(Sigmoid)/broadcastSigmoid_42.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
Ω
+Conv_44(Conv)_load_weights/weights_constant
'Conv_44(Conv)_load_weights/load_weightsConv_44(Conv)_load_weightsConv_44(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
_Conv_44(Conv)/psumConv_44(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
r
Conv_44(Conv)/actConv_44(Conv)_load_actConv_44(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
∂
3Conv_44(Conv)_load_weights/weights_constant/ptq_deq'Conv_44(Conv)_load_weights/load_weights'Conv_44(Conv)_load_weights/load_weights"GNNELoad*
module_typeJk510*
actionJtrue
È
@Sigmoid_45.(Sigmoid)/broadcast_store/ptq_new_st/const_load/const:Sigmoid_45.(Sigmoid)/broadcast_store/ptq_new_st/const_load:Sigmoid_45.(Sigmoid)/broadcast_store/ptq_new_st/const_load"GNNELoad*
module_typeJk510*
actionJtrue
Ö
Conv_44(Conv)Sigmoid_45.(Sigmoid)/broadcastSigmoid_45.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue

Sigmoid_45.(Sigmoid)/broadcast
:Sigmoid_45.(Sigmoid)/broadcast_store/ptq_new_st/const_load1Sigmoid_45.(Sigmoid)/broadcast_store/ptq_new_st_0/Sigmoid_45.(Sigmoid)/broadcast_store/ptq_new_st"	GNNEStore*
module_typeJk510*
actionJtrue
∞
Conv_41(Conv)_load_data
Conv_41(Conv)_load_weights
Conv_41(Conv)/psum
Conv_41(Conv)_load_actConv_41(Conv)Conv_41(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue
∑
Sigmoid_42.(Sigmoid)/broadcast
Conv_44(Conv)_load_weights
Conv_44(Conv)/psum
Conv_44(Conv)_load_actConv_44(Conv)Conv_44(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue6Sigmoid_45.(Sigmoid)/broadcast_store/ptq_new_st/fusionZ2
Concat_40(Concat)_NCHW



†
†ZE
+Conv_41(Conv)_load_weights/weights_constant

 


Z+
Conv_41(Conv)/act



 
ZB
(Conv_41(Conv)_load_data/const_load/const




ZM
3Conv_41(Conv)_load_weights/weights_constant/ptq_deq



 
ZE
+Conv_44(Conv)_load_weights/weights_constant

@
 

Z+
Conv_44(Conv)/act



@
ZM
3Conv_44(Conv)_load_weights/weights_constant/ptq_deq



@
ZZ
@Sigmoid_45.(Sigmoid)/broadcast_store/ptq_new_st/const_load/const



@
bK
1Sigmoid_45.(Sigmoid)/broadcast_store/ptq_new_st_0


@
P
Pj3
Conv_41(Conv)_load_data



†
†j4
Conv_41(Conv)_load_weights

 


j.
Conv_41(Conv)/psum


 
†
†j0
Conv_41(Conv)_load_act



 
j<
"Conv_41(Conv)_load_data/const_load




jA
'Conv_41(Conv)_load_weights/load_weights



 
j:
Sigmoid_42.(Sigmoid)/broadcast


 
†
†j4
Conv_44(Conv)_load_weights

@
 

j,
Conv_44(Conv)/psum


@
P
Pj0
Conv_44(Conv)_load_act



@
jA
'Conv_44(Conv)_load_weights/load_weights



@
jT
:Sigmoid_45.(Sigmoid)/broadcast_store/ptq_new_st/const_load



@
j8
Sigmoid_45.(Sigmoid)/broadcast


@
P
PjK
1Sigmoid_45.(Sigmoid)/broadcast_store/ptq_new_st_0


@
P
Pj)
Conv_41(Conv)


 
†
†j'
Conv_44(Conv)


@
P
P