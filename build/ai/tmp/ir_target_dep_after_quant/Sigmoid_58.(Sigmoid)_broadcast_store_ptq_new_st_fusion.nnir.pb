	nncase ir1.7.1:Ö
½
6Sigmoid_45.(Sigmoid)/broadcast_store/ptq_new_st/fusion
"Conv_57(Conv)_load_data/const_loadConv_57(Conv)_load_dataConv_57(Conv)_load_data"GNNELoad*
module_typeJk510*
actionJtrue
½
+Conv_57(Conv)_load_weights/weights_constant
'Conv_57(Conv)_load_weights/load_weightsConv_57(Conv)_load_weightsConv_57(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
_Conv_57(Conv)/psumConv_57(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
r
Conv_57(Conv)/actConv_57(Conv)_load_actConv_57(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
¡
(Conv_57(Conv)_load_data/const_load/const"Conv_57(Conv)_load_data/const_load"Conv_57(Conv)_load_data/const_load"GNNELoad*
module_typeJk510*
actionJtrue
¶
3Conv_57(Conv)_load_weights/weights_constant/ptq_deq'Conv_57(Conv)_load_weights/load_weights'Conv_57(Conv)_load_weights/load_weights"GNNELoad*
module_typeJk510*
actionJtrue
é
@Sigmoid_58.(Sigmoid)/broadcast_store/ptq_new_st/const_load/const:Sigmoid_58.(Sigmoid)/broadcast_store/ptq_new_st/const_load:Sigmoid_58.(Sigmoid)/broadcast_store/ptq_new_st/const_load"GNNELoad*
module_typeJk510*
actionJtrue
…
Conv_57(Conv)Sigmoid_58.(Sigmoid)/broadcastSigmoid_58.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
ð
Sigmoid_58.(Sigmoid)/broadcast
:Sigmoid_58.(Sigmoid)/broadcast_store/ptq_new_st/const_load1Sigmoid_58.(Sigmoid)/broadcast_store/ptq_new_st_0/Sigmoid_58.(Sigmoid)/broadcast_store/ptq_new_st"	GNNEStore*
module_typeJk510*
actionJtrue
°
Conv_57(Conv)_load_data
Conv_57(Conv)_load_weights
Conv_57(Conv)/psum
Conv_57(Conv)_load_actConv_57(Conv)Conv_57(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue6Sigmoid_58.(Sigmoid)/broadcast_store/ptq_new_st/fusionZP
6Sigmoid_45.(Sigmoid)/broadcast_store/ptq_new_st/fusion


@
P
PZE
+Conv_57(Conv)_load_weights/weights_constant

 
@

Z+
Conv_57(Conv)/act



 
ZB
(Conv_57(Conv)_load_data/const_load/const



@
ZM
3Conv_57(Conv)_load_weights/weights_constant/ptq_deq



 
ZZ
@Sigmoid_58.(Sigmoid)/broadcast_store/ptq_new_st/const_load/const



 
bK
1Sigmoid_58.(Sigmoid)/broadcast_store/ptq_new_st_0


 
P
Pj1
Conv_57(Conv)_load_data


@
P
Pj4
Conv_57(Conv)_load_weights

 
@

j,
Conv_57(Conv)/psum


 
P
Pj0
Conv_57(Conv)_load_act



 
j<
"Conv_57(Conv)_load_data/const_load



@
jA
'Conv_57(Conv)_load_weights/load_weights



 
jT
:Sigmoid_58.(Sigmoid)/broadcast_store/ptq_new_st/const_load



 
j8
Sigmoid_58.(Sigmoid)/broadcast


 
P
PjK
1Sigmoid_58.(Sigmoid)/broadcast_store/ptq_new_st_0


 
P
Pj'
Conv_57(Conv)


 
P
P