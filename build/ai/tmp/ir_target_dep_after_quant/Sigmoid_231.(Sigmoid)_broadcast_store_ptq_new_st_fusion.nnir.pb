	nncase ir1.7.1:ö!
š
Concat_226(Concat)
!Conv_227(Conv)_load_data_deq_loadConv_227(Conv)_load_dataConv_227(Conv)_load_data"GNNELoad*
module_typeJk510*
actionJtrue
Á
,Conv_227(Conv)_load_weights/weights_constant
(Conv_227(Conv)_load_weights/load_weightsConv_227(Conv)_load_weightsConv_227(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
aConv_227(Conv)/psumConv_227(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
u
Conv_227(Conv)/actConv_227(Conv)_load_actConv_227(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
™
"Conv_227(Conv)_load_data_deq_const!Conv_227(Conv)_load_data_deq_load!Conv_227(Conv)_load_data_deq_load"GNNELoad*
module_typeJk510*
actionJtrue
¹
4Conv_227(Conv)_load_weights/weights_constant/ptq_deq(Conv_227(Conv)_load_weights/load_weights(Conv_227(Conv)_load_weights/load_weights"GNNELoad*
module_typeJk510*
actionJtrue
ˆ
Conv_227(Conv)Sigmoid_228.(Sigmoid)/broadcastSigmoid_228.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
Á
,Conv_230(Conv)_load_weights/weights_constant
(Conv_230(Conv)_load_weights/load_weightsConv_230(Conv)_load_weightsConv_230(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
aConv_230(Conv)/psumConv_230(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
u
Conv_230(Conv)/actConv_230(Conv)_load_actConv_230(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
¹
4Conv_230(Conv)_load_weights/weights_constant/ptq_deq(Conv_230(Conv)_load_weights/load_weights(Conv_230(Conv)_load_weights/load_weights"GNNELoad*
module_typeJk510*
actionJtrue
ì
ASigmoid_231.(Sigmoid)/broadcast_store/ptq_new_st/const_load/const;Sigmoid_231.(Sigmoid)/broadcast_store/ptq_new_st/const_load;Sigmoid_231.(Sigmoid)/broadcast_store/ptq_new_st/const_load"GNNELoad*
module_typeJk510*
actionJtrue
ˆ
Conv_230(Conv)Sigmoid_231.(Sigmoid)/broadcastSigmoid_231.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
ô
Sigmoid_231.(Sigmoid)/broadcast
;Sigmoid_231.(Sigmoid)/broadcast_store/ptq_new_st/const_load2Sigmoid_231.(Sigmoid)/broadcast_store/ptq_new_st_00Sigmoid_231.(Sigmoid)/broadcast_store/ptq_new_st"	GNNEStore*
module_typeJk510*
actionJtrue
¶
Conv_227(Conv)_load_data
Conv_227(Conv)_load_weights
Conv_227(Conv)/psum
Conv_227(Conv)_load_actConv_227(Conv)Conv_227(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue
½
Sigmoid_228.(Sigmoid)/broadcast
Conv_230(Conv)_load_weights
Conv_230(Conv)/psum
Conv_230(Conv)_load_actConv_230(Conv)Conv_230(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue7Sigmoid_231.(Sigmoid)/broadcast_store/ptq_new_st/fusionZ-
Concat_226(Concat)


€



ZH
,Conv_227(Conv)_load_weights/weights_constant

€
€

Z-
Conv_227(Conv)/act



€
Z=
"Conv_227(Conv)_load_data_deq_const



€
ZO
4Conv_227(Conv)_load_weights/weights_constant/ptq_deq



€
ZH
,Conv_230(Conv)_load_weights/weights_constant

€
€

Z-
Conv_230(Conv)/act



€
ZO
4Conv_230(Conv)_load_weights/weights_constant/ptq_deq



€
Z\
ASigmoid_231.(Sigmoid)/broadcast_store/ptq_new_st/const_load/const



€
bM
2Sigmoid_231.(Sigmoid)/broadcast_store/ptq_new_st_0


€



j3
Conv_227(Conv)_load_data


€



j7
Conv_227(Conv)_load_weights

€
€

j.
Conv_227(Conv)/psum


€



j2
Conv_227(Conv)_load_act



€
j<
!Conv_227(Conv)_load_data_deq_load



€
jC
(Conv_227(Conv)_load_weights/load_weights



€
j:
Sigmoid_228.(Sigmoid)/broadcast


€



j7
Conv_230(Conv)_load_weights

€
€

j.
Conv_230(Conv)/psum


€



j2
Conv_230(Conv)_load_act



€
jC
(Conv_230(Conv)_load_weights/load_weights



€
jV
;Sigmoid_231.(Sigmoid)/broadcast_store/ptq_new_st/const_load



€
j:
Sigmoid_231.(Sigmoid)/broadcast


€



jM
2Sigmoid_231.(Sigmoid)/broadcast_store/ptq_new_st_0


€



j)
Conv_227(Conv)


€



j)
Conv_230(Conv)


€



