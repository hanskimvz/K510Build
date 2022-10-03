	nncase ir1.7.1:ž
Á
7Sigmoid_159.(Sigmoid)/broadcast_store/ptq_new_st/fusion
#Conv_161(Conv)_load_data/const_loadConv_161(Conv)_load_dataConv_161(Conv)_load_data"GNNELoad*
module_typeJk510*
actionJtrue
Á
,Conv_161(Conv)_load_weights/weights_constant
(Conv_161(Conv)_load_weights/load_weightsConv_161(Conv)_load_weightsConv_161(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
aConv_161(Conv)/psumConv_161(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
u
Conv_161(Conv)/actConv_161(Conv)_load_actConv_161(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
¤
)Conv_161(Conv)_load_data/const_load/const#Conv_161(Conv)_load_data/const_load#Conv_161(Conv)_load_data/const_load"GNNELoad*
module_typeJk510*
actionJtrue
¹
4Conv_161(Conv)_load_weights/weights_constant/ptq_deq(Conv_161(Conv)_load_weights/load_weights(Conv_161(Conv)_load_weights/load_weights"GNNELoad*
module_typeJk510*
actionJtrue
ì
ASigmoid_162.(Sigmoid)/broadcast_store/ptq_new_st/const_load/const;Sigmoid_162.(Sigmoid)/broadcast_store/ptq_new_st/const_load;Sigmoid_162.(Sigmoid)/broadcast_store/ptq_new_st/const_load"GNNELoad*
module_typeJk510*
actionJtrue
ˆ
Conv_161(Conv)Sigmoid_162.(Sigmoid)/broadcastSigmoid_162.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
ô
Sigmoid_162.(Sigmoid)/broadcast
;Sigmoid_162.(Sigmoid)/broadcast_store/ptq_new_st/const_load2Sigmoid_162.(Sigmoid)/broadcast_store/ptq_new_st_00Sigmoid_162.(Sigmoid)/broadcast_store/ptq_new_st"	GNNEStore*
module_typeJk510*
actionJtrue
¶
Conv_161(Conv)_load_data
Conv_161(Conv)_load_weights
Conv_161(Conv)/psum
Conv_161(Conv)_load_actConv_161(Conv)Conv_161(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue7Sigmoid_162.(Sigmoid)/broadcast_store/ptq_new_st/fusionZR
7Sigmoid_159.(Sigmoid)/broadcast_store/ptq_new_st/fusion


€



ZH
,Conv_161(Conv)_load_weights/weights_constant

€
€

Z-
Conv_161(Conv)/act



€
ZD
)Conv_161(Conv)_load_data/const_load/const



€
ZO
4Conv_161(Conv)_load_weights/weights_constant/ptq_deq



€
Z\
ASigmoid_162.(Sigmoid)/broadcast_store/ptq_new_st/const_load/const



€
bM
2Sigmoid_162.(Sigmoid)/broadcast_store/ptq_new_st_0


€



j3
Conv_161(Conv)_load_data


€



j7
Conv_161(Conv)_load_weights

€
€

j.
Conv_161(Conv)/psum


€



j2
Conv_161(Conv)_load_act



€
j>
#Conv_161(Conv)_load_data/const_load



€
jC
(Conv_161(Conv)_load_weights/load_weights



€
jV
;Sigmoid_162.(Sigmoid)/broadcast_store/ptq_new_st/const_load



€
j:
Sigmoid_162.(Sigmoid)/broadcast


€



jM
2Sigmoid_162.(Sigmoid)/broadcast_store/ptq_new_st_0


€



j)
Conv_161(Conv)


€



