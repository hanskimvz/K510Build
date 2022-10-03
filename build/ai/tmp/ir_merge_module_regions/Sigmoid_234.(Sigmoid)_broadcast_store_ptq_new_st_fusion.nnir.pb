	nncase ir1.7.1:ž
Á
7Sigmoid_231.(Sigmoid)/broadcast_store/ptq_new_st/fusion
#Conv_233(Conv)_load_data/const_loadConv_233(Conv)_load_dataConv_233(Conv)_load_data"GNNELoad*
module_typeJk510*
actionJtrue
Á
,Conv_233(Conv)_load_weights/weights_constant
(Conv_233(Conv)_load_weights/load_weightsConv_233(Conv)_load_weightsConv_233(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
aConv_233(Conv)/psumConv_233(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
u
Conv_233(Conv)/actConv_233(Conv)_load_actConv_233(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
¤
)Conv_233(Conv)_load_data/const_load/const#Conv_233(Conv)_load_data/const_load#Conv_233(Conv)_load_data/const_load"GNNELoad*
module_typeJk510*
actionJtrue
¹
4Conv_233(Conv)_load_weights/weights_constant/ptq_deq(Conv_233(Conv)_load_weights/load_weights(Conv_233(Conv)_load_weights/load_weights"GNNELoad*
module_typeJk510*
actionJtrue
ì
ASigmoid_234.(Sigmoid)/broadcast_store/ptq_new_st/const_load/const;Sigmoid_234.(Sigmoid)/broadcast_store/ptq_new_st/const_load;Sigmoid_234.(Sigmoid)/broadcast_store/ptq_new_st/const_load"GNNELoad*
module_typeJk510*
actionJtrue
ˆ
Conv_233(Conv)Sigmoid_234.(Sigmoid)/broadcastSigmoid_234.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
ô
Sigmoid_234.(Sigmoid)/broadcast
;Sigmoid_234.(Sigmoid)/broadcast_store/ptq_new_st/const_load2Sigmoid_234.(Sigmoid)/broadcast_store/ptq_new_st_00Sigmoid_234.(Sigmoid)/broadcast_store/ptq_new_st"	GNNEStore*
module_typeJk510*
actionJtrue
¶
Conv_233(Conv)_load_data
Conv_233(Conv)_load_weights
Conv_233(Conv)/psum
Conv_233(Conv)_load_actConv_233(Conv)Conv_233(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue7Sigmoid_234.(Sigmoid)/broadcast_store/ptq_new_st/fusionZR
7Sigmoid_231.(Sigmoid)/broadcast_store/ptq_new_st/fusion


€



ZH
,Conv_233(Conv)_load_weights/weights_constant

€
€

Z-
Conv_233(Conv)/act



€
ZD
)Conv_233(Conv)_load_data/const_load/const



€
ZO
4Conv_233(Conv)_load_weights/weights_constant/ptq_deq



€
Z\
ASigmoid_234.(Sigmoid)/broadcast_store/ptq_new_st/const_load/const



€
bM
2Sigmoid_234.(Sigmoid)/broadcast_store/ptq_new_st_0


€



j3
Conv_233(Conv)_load_data


€



j7
Conv_233(Conv)_load_weights

€
€

j.
Conv_233(Conv)/psum


€



j2
Conv_233(Conv)_load_act



€
j>
#Conv_233(Conv)_load_data/const_load



€
jC
(Conv_233(Conv)_load_weights/load_weights



€
jV
;Sigmoid_234.(Sigmoid)/broadcast_store/ptq_new_st/const_load



€
j:
Sigmoid_234.(Sigmoid)/broadcast


€



jM
2Sigmoid_234.(Sigmoid)/broadcast_store/ptq_new_st_0


€



j)
Conv_233(Conv)


€



