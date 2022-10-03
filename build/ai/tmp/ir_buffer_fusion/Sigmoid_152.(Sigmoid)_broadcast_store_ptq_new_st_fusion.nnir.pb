	nncase ir1.7.1:ž
Á
7Sigmoid_149.(Sigmoid)/broadcast_store/ptq_new_st/fusion
#Conv_151(Conv)_load_data/const_loadConv_151(Conv)_load_dataConv_151(Conv)_load_data"GNNELoad*
module_typeJk510*
actionJtrue
Á
,Conv_151(Conv)_load_weights/weights_constant
(Conv_151(Conv)_load_weights/load_weightsConv_151(Conv)_load_weightsConv_151(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
aConv_151(Conv)/psumConv_151(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
u
Conv_151(Conv)/actConv_151(Conv)_load_actConv_151(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
¤
)Conv_151(Conv)_load_data/const_load/const#Conv_151(Conv)_load_data/const_load#Conv_151(Conv)_load_data/const_load"GNNELoad*
module_typeJk510*
actionJtrue
¹
4Conv_151(Conv)_load_weights/weights_constant/ptq_deq(Conv_151(Conv)_load_weights/load_weights(Conv_151(Conv)_load_weights/load_weights"GNNELoad*
module_typeJk510*
actionJtrue
ì
ASigmoid_152.(Sigmoid)/broadcast_store/ptq_new_st/const_load/const;Sigmoid_152.(Sigmoid)/broadcast_store/ptq_new_st/const_load;Sigmoid_152.(Sigmoid)/broadcast_store/ptq_new_st/const_load"GNNELoad*
module_typeJk510*
actionJtrue
ˆ
Conv_151(Conv)Sigmoid_152.(Sigmoid)/broadcastSigmoid_152.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
ô
Sigmoid_152.(Sigmoid)/broadcast
;Sigmoid_152.(Sigmoid)/broadcast_store/ptq_new_st/const_load2Sigmoid_152.(Sigmoid)/broadcast_store/ptq_new_st_00Sigmoid_152.(Sigmoid)/broadcast_store/ptq_new_st"	GNNEStore*
module_typeJk510*
actionJtrue
¶
Conv_151(Conv)_load_data
Conv_151(Conv)_load_weights
Conv_151(Conv)/psum
Conv_151(Conv)_load_actConv_151(Conv)Conv_151(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue7Sigmoid_152.(Sigmoid)/broadcast_store/ptq_new_st/fusionZR
7Sigmoid_149.(Sigmoid)/broadcast_store/ptq_new_st/fusion


€



ZH
,Conv_151(Conv)_load_weights/weights_constant

€
€

Z-
Conv_151(Conv)/act



€
ZD
)Conv_151(Conv)_load_data/const_load/const



€
ZO
4Conv_151(Conv)_load_weights/weights_constant/ptq_deq



€
Z\
ASigmoid_152.(Sigmoid)/broadcast_store/ptq_new_st/const_load/const



€
bM
2Sigmoid_152.(Sigmoid)/broadcast_store/ptq_new_st_0


€



j3
Conv_151(Conv)_load_data


€



j7
Conv_151(Conv)_load_weights

€
€

j.
Conv_151(Conv)/psum


€



j2
Conv_151(Conv)_load_act



€
j>
#Conv_151(Conv)_load_data/const_load



€
jC
(Conv_151(Conv)_load_weights/load_weights



€
jV
;Sigmoid_152.(Sigmoid)/broadcast_store/ptq_new_st/const_load



€
j:
Sigmoid_152.(Sigmoid)/broadcast


€



jM
2Sigmoid_152.(Sigmoid)/broadcast_store/ptq_new_st_0


€



j)
Conv_151(Conv)


€



