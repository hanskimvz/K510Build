	nncase ir1.7.1:å!
½
6Sigmoid_48.(Sigmoid)/broadcast_store/ptq_new_st/fusion
"Conv_50(Conv)_load_data/const_loadConv_50(Conv)_load_dataConv_50(Conv)_load_data"GNNELoad*
module_typeJk510*
actionJtrue
½
+Conv_50(Conv)_load_weights/weights_constant
'Conv_50(Conv)_load_weights/load_weightsConv_50(Conv)_load_weightsConv_50(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
_Conv_50(Conv)/psumConv_50(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
r
Conv_50(Conv)/actConv_50(Conv)_load_actConv_50(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
¡
(Conv_50(Conv)_load_data/const_load/const"Conv_50(Conv)_load_data/const_load"Conv_50(Conv)_load_data/const_load"GNNELoad*
module_typeJk510*
actionJtrue
¶
3Conv_50(Conv)_load_weights/weights_constant/ptq_deq'Conv_50(Conv)_load_weights/load_weights'Conv_50(Conv)_load_weights/load_weights"GNNELoad*
module_typeJk510*
actionJtrue
…
Conv_50(Conv)Sigmoid_51.(Sigmoid)/broadcastSigmoid_51.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
½
+Conv_53(Conv)_load_weights/weights_constant
'Conv_53(Conv)_load_weights/load_weightsConv_53(Conv)_load_weightsConv_53(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
_Conv_53(Conv)/psumConv_53(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
r
Conv_53(Conv)/actConv_53(Conv)_load_actConv_53(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
¶
3Conv_53(Conv)_load_weights/weights_constant/ptq_deq'Conv_53(Conv)_load_weights/load_weights'Conv_53(Conv)_load_weights/load_weights"GNNELoad*
module_typeJk510*
actionJtrue
é
@Sigmoid_54.(Sigmoid)/broadcast_store/ptq_new_st/const_load/const:Sigmoid_54.(Sigmoid)/broadcast_store/ptq_new_st/const_load:Sigmoid_54.(Sigmoid)/broadcast_store/ptq_new_st/const_load"GNNELoad*
module_typeJk510*
actionJtrue
…
Conv_53(Conv)Sigmoid_54.(Sigmoid)/broadcastSigmoid_54.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
ð
Sigmoid_54.(Sigmoid)/broadcast
:Sigmoid_54.(Sigmoid)/broadcast_store/ptq_new_st/const_load1Sigmoid_54.(Sigmoid)/broadcast_store/ptq_new_st_0/Sigmoid_54.(Sigmoid)/broadcast_store/ptq_new_st"	GNNEStore*
module_typeJk510*
actionJtrue
°
Conv_50(Conv)_load_data
Conv_50(Conv)_load_weights
Conv_50(Conv)/psum
Conv_50(Conv)_load_actConv_50(Conv)Conv_50(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue
·
Sigmoid_51.(Sigmoid)/broadcast
Conv_53(Conv)_load_weights
Conv_53(Conv)/psum
Conv_53(Conv)_load_actConv_53(Conv)Conv_53(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue6Sigmoid_54.(Sigmoid)/broadcast_store/ptq_new_st/fusionZP
6Sigmoid_48.(Sigmoid)/broadcast_store/ptq_new_st/fusion


 
P
PZE
+Conv_50(Conv)_load_weights/weights_constant

 
 

Z+
Conv_50(Conv)/act



 
ZB
(Conv_50(Conv)_load_data/const_load/const



 
ZM
3Conv_50(Conv)_load_weights/weights_constant/ptq_deq



 
ZE
+Conv_53(Conv)_load_weights/weights_constant

 
 

Z+
Conv_53(Conv)/act



 
ZM
3Conv_53(Conv)_load_weights/weights_constant/ptq_deq



 
ZZ
@Sigmoid_54.(Sigmoid)/broadcast_store/ptq_new_st/const_load/const



 
bK
1Sigmoid_54.(Sigmoid)/broadcast_store/ptq_new_st_0


 
P
Pj1
Conv_50(Conv)_load_data


 
P
Pj4
Conv_50(Conv)_load_weights

 
 

j,
Conv_50(Conv)/psum


 
P
Pj0
Conv_50(Conv)_load_act



 
j<
"Conv_50(Conv)_load_data/const_load



 
jA
'Conv_50(Conv)_load_weights/load_weights



 
j8
Sigmoid_51.(Sigmoid)/broadcast


 
P
Pj4
Conv_53(Conv)_load_weights

 
 

j,
Conv_53(Conv)/psum


 
P
Pj0
Conv_53(Conv)_load_act



 
jA
'Conv_53(Conv)_load_weights/load_weights



 
jT
:Sigmoid_54.(Sigmoid)/broadcast_store/ptq_new_st/const_load



 
j8
Sigmoid_54.(Sigmoid)/broadcast


 
P
PjK
1Sigmoid_54.(Sigmoid)/broadcast_store/ptq_new_st_0


 
P
Pj'
Conv_50(Conv)


 
P
Pj'
Conv_53(Conv)


 
P
P