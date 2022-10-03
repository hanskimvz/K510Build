	nncase ir1.7.1:Ö
½
6Sigmoid_45.(Sigmoid)/broadcast_store/ptq_new_st/fusion
"Conv_47(Conv)_load_data/const_loadConv_47(Conv)_load_dataConv_47(Conv)_load_data"GNNELoad*
module_typeJk510*
actionJtrue
½
+Conv_47(Conv)_load_weights/weights_constant
'Conv_47(Conv)_load_weights/load_weightsConv_47(Conv)_load_weightsConv_47(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
_Conv_47(Conv)/psumConv_47(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
r
Conv_47(Conv)/actConv_47(Conv)_load_actConv_47(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
¡
(Conv_47(Conv)_load_data/const_load/const"Conv_47(Conv)_load_data/const_load"Conv_47(Conv)_load_data/const_load"GNNELoad*
module_typeJk510*
actionJtrue
¶
3Conv_47(Conv)_load_weights/weights_constant/ptq_deq'Conv_47(Conv)_load_weights/load_weights'Conv_47(Conv)_load_weights/load_weights"GNNELoad*
module_typeJk510*
actionJtrue
é
@Sigmoid_48.(Sigmoid)/broadcast_store/ptq_new_st/const_load/const:Sigmoid_48.(Sigmoid)/broadcast_store/ptq_new_st/const_load:Sigmoid_48.(Sigmoid)/broadcast_store/ptq_new_st/const_load"GNNELoad*
module_typeJk510*
actionJtrue
…
Conv_47(Conv)Sigmoid_48.(Sigmoid)/broadcastSigmoid_48.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
ð
Sigmoid_48.(Sigmoid)/broadcast
:Sigmoid_48.(Sigmoid)/broadcast_store/ptq_new_st/const_load1Sigmoid_48.(Sigmoid)/broadcast_store/ptq_new_st_0/Sigmoid_48.(Sigmoid)/broadcast_store/ptq_new_st"	GNNEStore*
module_typeJk510*
actionJtrue
°
Conv_47(Conv)_load_data
Conv_47(Conv)_load_weights
Conv_47(Conv)/psum
Conv_47(Conv)_load_actConv_47(Conv)Conv_47(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue6Sigmoid_48.(Sigmoid)/broadcast_store/ptq_new_st/fusionZP
6Sigmoid_45.(Sigmoid)/broadcast_store/ptq_new_st/fusion


@
P
PZE
+Conv_47(Conv)_load_weights/weights_constant

 
@

Z+
Conv_47(Conv)/act



 
ZB
(Conv_47(Conv)_load_data/const_load/const



@
ZM
3Conv_47(Conv)_load_weights/weights_constant/ptq_deq



 
ZZ
@Sigmoid_48.(Sigmoid)/broadcast_store/ptq_new_st/const_load/const



 
bK
1Sigmoid_48.(Sigmoid)/broadcast_store/ptq_new_st_0


 
P
Pj1
Conv_47(Conv)_load_data


@
P
Pj4
Conv_47(Conv)_load_weights

 
@

j,
Conv_47(Conv)/psum


 
P
Pj0
Conv_47(Conv)_load_act



 
j<
"Conv_47(Conv)_load_data/const_load



@
jA
'Conv_47(Conv)_load_weights/load_weights



 
jT
:Sigmoid_48.(Sigmoid)/broadcast_store/ptq_new_st/const_load



 
j8
Sigmoid_48.(Sigmoid)/broadcast


 
P
PjK
1Sigmoid_48.(Sigmoid)/broadcast_store/ptq_new_st_0


 
P
Pj'
Conv_47(Conv)


 
P
P