	nncase ir1.7.1:?
?
Concat_165(Concat)
!Conv_175(Conv)_load_data_deq_loadConv_175(Conv)_load_dataConv_175(Conv)_load_data"GNNELoad*
module_typeJk510*
actionJtrue
?
,Conv_175(Conv)_load_weights/weights_constant
(Conv_175(Conv)_load_weights/load_weightsConv_175(Conv)_load_weightsConv_175(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
aConv_175(Conv)/psumConv_175(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
u
Conv_175(Conv)/actConv_175(Conv)_load_actConv_175(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
?
"Conv_175(Conv)_load_data_deq_const!Conv_175(Conv)_load_data_deq_load!Conv_175(Conv)_load_data_deq_load"GNNELoad*
module_typeJk510*
actionJtrue
?
4Conv_175(Conv)_load_weights/weights_constant/ptq_deq(Conv_175(Conv)_load_weights/load_weights(Conv_175(Conv)_load_weights/load_weights"GNNELoad*
module_typeJk510*
actionJtrue
?
ASigmoid_176.(Sigmoid)/broadcast_store/ptq_new_st/const_load/const;Sigmoid_176.(Sigmoid)/broadcast_store/ptq_new_st/const_load;Sigmoid_176.(Sigmoid)/broadcast_store/ptq_new_st/const_load"GNNELoad*
module_typeJk510*
actionJtrue
?
Conv_175(Conv)Sigmoid_176.(Sigmoid)/broadcastSigmoid_176.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
?
Sigmoid_176.(Sigmoid)/broadcast
;Sigmoid_176.(Sigmoid)/broadcast_store/ptq_new_st/const_load2Sigmoid_176.(Sigmoid)/broadcast_store/ptq_new_st_00Sigmoid_176.(Sigmoid)/broadcast_store/ptq_new_st"	GNNEStore*
module_typeJk510*
actionJtrue
?
Conv_175(Conv)_load_data
Conv_175(Conv)_load_weights
Conv_175(Conv)/psum
Conv_175(Conv)_load_actConv_175(Conv)Conv_175(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue7Sigmoid_176.(Sigmoid)/broadcast_store/ptq_new_st/fusionZ-
Concat_165(Concat)


?

ZH
,Conv_175(Conv)_load_weights/weights_constant

?
?

Z-
Conv_175(Conv)/act



?
Z=
"Conv_175(Conv)_load_data_deq_const



?
ZO
4Conv_175(Conv)_load_weights/weights_constant/ptq_deq



?
Z\
ASigmoid_176.(Sigmoid)/broadcast_store/ptq_new_st/const_load/const



?
bM
2Sigmoid_176.(Sigmoid)/broadcast_store/ptq_new_st_0


?

j3
Conv_175(Conv)_load_data


?

j7
Conv_175(Conv)_load_weights

?
?

j.
Conv_175(Conv)/psum


?

j2
Conv_175(Conv)_load_act



?
j<
!Conv_175(Conv)_load_data_deq_load



?
jC
(Conv_175(Conv)_load_weights/load_weights



?
jV
;Sigmoid_176.(Sigmoid)/broadcast_store/ptq_new_st/const_load



?
j:
Sigmoid_176.(Sigmoid)/broadcast


?

jM
2Sigmoid_176.(Sigmoid)/broadcast_store/ptq_new_st_0


?

j)
Conv_175(Conv)


?

