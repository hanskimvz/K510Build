	nncase ir1.7.1:Ö"
Á
7Sigmoid_143.(Sigmoid)/broadcast_store/ptq_new_st/fusion
#Conv_145(Conv)_load_data/const_loadConv_145(Conv)_load_dataConv_145(Conv)_load_data"GNNELoad*
module_typeJk510*
actionJtrue
Á
,Conv_145(Conv)_load_weights/weights_constant
(Conv_145(Conv)_load_weights/load_weightsConv_145(Conv)_load_weightsConv_145(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
aConv_145(Conv)/psumConv_145(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
u
Conv_145(Conv)/actConv_145(Conv)_load_actConv_145(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
¤
)Conv_145(Conv)_load_data/const_load/const#Conv_145(Conv)_load_data/const_load#Conv_145(Conv)_load_data/const_load"GNNELoad*
module_typeJk510*
actionJtrue
¹
4Conv_145(Conv)_load_weights/weights_constant/ptq_deq(Conv_145(Conv)_load_weights/load_weights(Conv_145(Conv)_load_weights/load_weights"GNNELoad*
module_typeJk510*
actionJtrue
ˆ
Conv_145(Conv)Sigmoid_146.(Sigmoid)/broadcastSigmoid_146.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
Á
,Conv_148(Conv)_load_weights/weights_constant
(Conv_148(Conv)_load_weights/load_weightsConv_148(Conv)_load_weightsConv_148(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
aConv_148(Conv)/psumConv_148(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
u
Conv_148(Conv)/actConv_148(Conv)_load_actConv_148(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
¹
4Conv_148(Conv)_load_weights/weights_constant/ptq_deq(Conv_148(Conv)_load_weights/load_weights(Conv_148(Conv)_load_weights/load_weights"GNNELoad*
module_typeJk510*
actionJtrue
ì
ASigmoid_149.(Sigmoid)/broadcast_store/ptq_new_st/const_load/const;Sigmoid_149.(Sigmoid)/broadcast_store/ptq_new_st/const_load;Sigmoid_149.(Sigmoid)/broadcast_store/ptq_new_st/const_load"GNNELoad*
module_typeJk510*
actionJtrue
ˆ
Conv_148(Conv)Sigmoid_149.(Sigmoid)/broadcastSigmoid_149.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
ô
Sigmoid_149.(Sigmoid)/broadcast
;Sigmoid_149.(Sigmoid)/broadcast_store/ptq_new_st/const_load2Sigmoid_149.(Sigmoid)/broadcast_store/ptq_new_st_00Sigmoid_149.(Sigmoid)/broadcast_store/ptq_new_st"	GNNEStore*
module_typeJk510*
actionJtrue
¶
Conv_145(Conv)_load_data
Conv_145(Conv)_load_weights
Conv_145(Conv)/psum
Conv_145(Conv)_load_actConv_145(Conv)Conv_145(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue
½
Sigmoid_146.(Sigmoid)/broadcast
Conv_148(Conv)_load_weights
Conv_148(Conv)/psum
Conv_148(Conv)_load_actConv_148(Conv)Conv_148(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue7Sigmoid_149.(Sigmoid)/broadcast_store/ptq_new_st/fusionZR
7Sigmoid_143.(Sigmoid)/broadcast_store/ptq_new_st/fusion


€



ZH
,Conv_145(Conv)_load_weights/weights_constant

€
€

Z-
Conv_145(Conv)/act



€
ZD
)Conv_145(Conv)_load_data/const_load/const



€
ZO
4Conv_145(Conv)_load_weights/weights_constant/ptq_deq



€
ZH
,Conv_148(Conv)_load_weights/weights_constant

€
€

Z-
Conv_148(Conv)/act



€
ZO
4Conv_148(Conv)_load_weights/weights_constant/ptq_deq



€
Z\
ASigmoid_149.(Sigmoid)/broadcast_store/ptq_new_st/const_load/const



€
bM
2Sigmoid_149.(Sigmoid)/broadcast_store/ptq_new_st_0


€



j3
Conv_145(Conv)_load_data


€



j7
Conv_145(Conv)_load_weights

€
€

j.
Conv_145(Conv)/psum


€



j2
Conv_145(Conv)_load_act



€
j>
#Conv_145(Conv)_load_data/const_load



€
jC
(Conv_145(Conv)_load_weights/load_weights



€
j:
Sigmoid_146.(Sigmoid)/broadcast


€



j7
Conv_148(Conv)_load_weights

€
€

j.
Conv_148(Conv)/psum


€



j2
Conv_148(Conv)_load_act



€
jC
(Conv_148(Conv)_load_weights/load_weights



€
jV
;Sigmoid_149.(Sigmoid)/broadcast_store/ptq_new_st/const_load



€
j:
Sigmoid_149.(Sigmoid)/broadcast


€



jM
2Sigmoid_149.(Sigmoid)/broadcast_store/ptq_new_st_0


€



j)
Conv_145(Conv)


€



j)
Conv_148(Conv)


€



