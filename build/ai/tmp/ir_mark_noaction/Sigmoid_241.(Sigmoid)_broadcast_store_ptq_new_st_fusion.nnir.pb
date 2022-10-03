	nncase ir1.7.1:¾
š
Concat_239(Concat)
!Conv_240(Conv)_load_data_deq_loadConv_240(Conv)_load_dataConv_240(Conv)_load_data"GNNELoad*
module_typeJk510*
actionJtrue
Á
,Conv_240(Conv)_load_weights/weights_constant
(Conv_240(Conv)_load_weights/load_weightsConv_240(Conv)_load_weightsConv_240(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
aConv_240(Conv)/psumConv_240(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
u
Conv_240(Conv)/actConv_240(Conv)_load_actConv_240(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
™
"Conv_240(Conv)_load_data_deq_const!Conv_240(Conv)_load_data_deq_load!Conv_240(Conv)_load_data_deq_load"GNNELoad*
module_typeJk510*
actionJtrue
¹
4Conv_240(Conv)_load_weights/weights_constant/ptq_deq(Conv_240(Conv)_load_weights/load_weights(Conv_240(Conv)_load_weights/load_weights"GNNELoad*
module_typeJk510*
actionJtrue
ì
ASigmoid_241.(Sigmoid)/broadcast_store/ptq_new_st/const_load/const;Sigmoid_241.(Sigmoid)/broadcast_store/ptq_new_st/const_load;Sigmoid_241.(Sigmoid)/broadcast_store/ptq_new_st/const_load"GNNELoad*
module_typeJk510*
actionJtrue
ˆ
Conv_240(Conv)Sigmoid_241.(Sigmoid)/broadcastSigmoid_241.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
ô
Sigmoid_241.(Sigmoid)/broadcast
;Sigmoid_241.(Sigmoid)/broadcast_store/ptq_new_st/const_load2Sigmoid_241.(Sigmoid)/broadcast_store/ptq_new_st_00Sigmoid_241.(Sigmoid)/broadcast_store/ptq_new_st"	GNNEStore*
module_typeJk510*
actionJtrue
¶
Conv_240(Conv)_load_data
Conv_240(Conv)_load_weights
Conv_240(Conv)/psum
Conv_240(Conv)_load_actConv_240(Conv)Conv_240(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue7Sigmoid_241.(Sigmoid)/broadcast_store/ptq_new_st/fusionZ-
Concat_239(Concat)


€



ZH
,Conv_240(Conv)_load_weights/weights_constant

€
€

Z-
Conv_240(Conv)/act



€
Z=
"Conv_240(Conv)_load_data_deq_const



€
ZO
4Conv_240(Conv)_load_weights/weights_constant/ptq_deq



€
Z\
ASigmoid_241.(Sigmoid)/broadcast_store/ptq_new_st/const_load/const



€
bM
2Sigmoid_241.(Sigmoid)/broadcast_store/ptq_new_st_0


€



j3
Conv_240(Conv)_load_data


€



j7
Conv_240(Conv)_load_weights

€
€

j.
Conv_240(Conv)/psum


€



j2
Conv_240(Conv)_load_act



€
j<
!Conv_240(Conv)_load_data_deq_load



€
jC
(Conv_240(Conv)_load_weights/load_weights



€
jV
;Sigmoid_241.(Sigmoid)/broadcast_store/ptq_new_st/const_load



€
j:
Sigmoid_241.(Sigmoid)/broadcast


€



jM
2Sigmoid_241.(Sigmoid)/broadcast_store/ptq_new_st_0


€



j)
Conv_240(Conv)


€



