	nncase ir1.7.1:¾
š
Concat_141(Concat)
!Conv_142(Conv)_load_data_deq_loadConv_142(Conv)_load_dataConv_142(Conv)_load_data"GNNELoad*
module_typeJk510*
actionJtrue
Á
,Conv_142(Conv)_load_weights/weights_constant
(Conv_142(Conv)_load_weights/load_weightsConv_142(Conv)_load_weightsConv_142(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
aConv_142(Conv)/psumConv_142(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
u
Conv_142(Conv)/actConv_142(Conv)_load_actConv_142(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
™
"Conv_142(Conv)_load_data_deq_const!Conv_142(Conv)_load_data_deq_load!Conv_142(Conv)_load_data_deq_load"GNNELoad*
module_typeJk510*
actionJtrue
¹
4Conv_142(Conv)_load_weights/weights_constant/ptq_deq(Conv_142(Conv)_load_weights/load_weights(Conv_142(Conv)_load_weights/load_weights"GNNELoad*
module_typeJk510*
actionJtrue
ì
ASigmoid_143.(Sigmoid)/broadcast_store/ptq_new_st/const_load/const;Sigmoid_143.(Sigmoid)/broadcast_store/ptq_new_st/const_load;Sigmoid_143.(Sigmoid)/broadcast_store/ptq_new_st/const_load"GNNELoad*
module_typeJk510*
actionJtrue
ˆ
Conv_142(Conv)Sigmoid_143.(Sigmoid)/broadcastSigmoid_143.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
ô
Sigmoid_143.(Sigmoid)/broadcast
;Sigmoid_143.(Sigmoid)/broadcast_store/ptq_new_st/const_load2Sigmoid_143.(Sigmoid)/broadcast_store/ptq_new_st_00Sigmoid_143.(Sigmoid)/broadcast_store/ptq_new_st"	GNNEStore*
module_typeJk510*
actionJtrue
¶
Conv_142(Conv)_load_data
Conv_142(Conv)_load_weights
Conv_142(Conv)/psum
Conv_142(Conv)_load_actConv_142(Conv)Conv_142(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue7Sigmoid_143.(Sigmoid)/broadcast_store/ptq_new_st/fusionZ-
Concat_141(Concat)


€



ZH
,Conv_142(Conv)_load_weights/weights_constant

€
€

Z-
Conv_142(Conv)/act



€
Z=
"Conv_142(Conv)_load_data_deq_const



€
ZO
4Conv_142(Conv)_load_weights/weights_constant/ptq_deq



€
Z\
ASigmoid_143.(Sigmoid)/broadcast_store/ptq_new_st/const_load/const



€
bM
2Sigmoid_143.(Sigmoid)/broadcast_store/ptq_new_st_0


€



j3
Conv_142(Conv)_load_data


€



j7
Conv_142(Conv)_load_weights

€
€

j.
Conv_142(Conv)/psum


€



j2
Conv_142(Conv)_load_act



€
j<
!Conv_142(Conv)_load_data_deq_load



€
jC
(Conv_142(Conv)_load_weights/load_weights



€
jV
;Sigmoid_143.(Sigmoid)/broadcast_store/ptq_new_st/const_load



€
j:
Sigmoid_143.(Sigmoid)/broadcast


€



jM
2Sigmoid_143.(Sigmoid)/broadcast_store/ptq_new_st_0


€



j)
Conv_142(Conv)


€



