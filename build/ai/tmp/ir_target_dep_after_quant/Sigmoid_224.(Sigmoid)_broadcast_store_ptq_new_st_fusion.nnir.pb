	nncase ir1.7.1:ž
Á
7Sigmoid_221.(Sigmoid)/broadcast_store/ptq_new_st/fusion
#Conv_223(Conv)_load_data/const_loadConv_223(Conv)_load_dataConv_223(Conv)_load_data"GNNELoad*
module_typeJk510*
actionJtrue
Á
,Conv_223(Conv)_load_weights/weights_constant
(Conv_223(Conv)_load_weights/load_weightsConv_223(Conv)_load_weightsConv_223(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
aConv_223(Conv)/psumConv_223(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
u
Conv_223(Conv)/actConv_223(Conv)_load_actConv_223(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
¤
)Conv_223(Conv)_load_data/const_load/const#Conv_223(Conv)_load_data/const_load#Conv_223(Conv)_load_data/const_load"GNNELoad*
module_typeJk510*
actionJtrue
¹
4Conv_223(Conv)_load_weights/weights_constant/ptq_deq(Conv_223(Conv)_load_weights/load_weights(Conv_223(Conv)_load_weights/load_weights"GNNELoad*
module_typeJk510*
actionJtrue
ì
ASigmoid_224.(Sigmoid)/broadcast_store/ptq_new_st/const_load/const;Sigmoid_224.(Sigmoid)/broadcast_store/ptq_new_st/const_load;Sigmoid_224.(Sigmoid)/broadcast_store/ptq_new_st/const_load"GNNELoad*
module_typeJk510*
actionJtrue
ˆ
Conv_223(Conv)Sigmoid_224.(Sigmoid)/broadcastSigmoid_224.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
ô
Sigmoid_224.(Sigmoid)/broadcast
;Sigmoid_224.(Sigmoid)/broadcast_store/ptq_new_st/const_load2Sigmoid_224.(Sigmoid)/broadcast_store/ptq_new_st_00Sigmoid_224.(Sigmoid)/broadcast_store/ptq_new_st"	GNNEStore*
module_typeJk510*
actionJtrue
¶
Conv_223(Conv)_load_data
Conv_223(Conv)_load_weights
Conv_223(Conv)/psum
Conv_223(Conv)_load_actConv_223(Conv)Conv_223(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue7Sigmoid_224.(Sigmoid)/broadcast_store/ptq_new_st/fusionZR
7Sigmoid_221.(Sigmoid)/broadcast_store/ptq_new_st/fusion


€

ZH
,Conv_223(Conv)_load_weights/weights_constant

€
€

Z-
Conv_223(Conv)/act



€
ZD
)Conv_223(Conv)_load_data/const_load/const



€
ZO
4Conv_223(Conv)_load_weights/weights_constant/ptq_deq



€
Z\
ASigmoid_224.(Sigmoid)/broadcast_store/ptq_new_st/const_load/const



€
bM
2Sigmoid_224.(Sigmoid)/broadcast_store/ptq_new_st_0


€



j3
Conv_223(Conv)_load_data


€

j7
Conv_223(Conv)_load_weights

€
€

j.
Conv_223(Conv)/psum


€



j2
Conv_223(Conv)_load_act



€
j>
#Conv_223(Conv)_load_data/const_load



€
jC
(Conv_223(Conv)_load_weights/load_weights



€
jV
;Sigmoid_224.(Sigmoid)/broadcast_store/ptq_new_st/const_load



€
j:
Sigmoid_224.(Sigmoid)/broadcast


€



jM
2Sigmoid_224.(Sigmoid)/broadcast_store/ptq_new_st_0


€



j)
Conv_223(Conv)


€



