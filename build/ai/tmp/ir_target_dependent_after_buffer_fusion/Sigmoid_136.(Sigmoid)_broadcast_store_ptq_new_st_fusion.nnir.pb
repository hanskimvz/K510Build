	nncase ir1.7.1:
º
0Sigmoid_133.(Sigmoid)/broadcast_store/ptq_new_st
#Conv_135(Conv)_load_data/const_loadConv_135(Conv)_load_dataConv_135(Conv)_load_data"GNNELoad*
module_typeJk510*
actionJtrue
Á
,Conv_135(Conv)_load_weights/weights_constant
(Conv_135(Conv)_load_weights/load_weightsConv_135(Conv)_load_weightsConv_135(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
aConv_135(Conv)/psumConv_135(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
u
Conv_135(Conv)/actConv_135(Conv)_load_actConv_135(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
¤
)Conv_135(Conv)_load_data/const_load/const#Conv_135(Conv)_load_data/const_load#Conv_135(Conv)_load_data/const_load"GNNELoad*
module_typeJk510*
actionJtrue
¹
4Conv_135(Conv)_load_weights/weights_constant/ptq_deq(Conv_135(Conv)_load_weights/load_weights(Conv_135(Conv)_load_weights/load_weights"GNNELoad*
module_typeJk510*
actionJtrue
ì
ASigmoid_136.(Sigmoid)/broadcast_store/ptq_new_st/const_load/const;Sigmoid_136.(Sigmoid)/broadcast_store/ptq_new_st/const_load;Sigmoid_136.(Sigmoid)/broadcast_store/ptq_new_st/const_load"GNNELoad*
module_typeJk510*
actionJtrue
ˆ
Conv_135(Conv)Sigmoid_136.(Sigmoid)/broadcastSigmoid_136.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
ô
Sigmoid_136.(Sigmoid)/broadcast
;Sigmoid_136.(Sigmoid)/broadcast_store/ptq_new_st/const_load2Sigmoid_136.(Sigmoid)/broadcast_store/ptq_new_st_00Sigmoid_136.(Sigmoid)/broadcast_store/ptq_new_st"	GNNEStore*
module_typeJk510*
actionJtrue
¶
Conv_135(Conv)_load_data
Conv_135(Conv)_load_weights
Conv_135(Conv)/psum
Conv_135(Conv)_load_actConv_135(Conv)Conv_135(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue7Sigmoid_136.(Sigmoid)/broadcast_store/ptq_new_st/fusionZK
0Sigmoid_133.(Sigmoid)/broadcast_store/ptq_new_st


€



ZH
,Conv_135(Conv)_load_weights/weights_constant

€
€

Z-
Conv_135(Conv)/act



€
ZD
)Conv_135(Conv)_load_data/const_load/const



€
ZO
4Conv_135(Conv)_load_weights/weights_constant/ptq_deq



€
Z\
ASigmoid_136.(Sigmoid)/broadcast_store/ptq_new_st/const_load/const



€
bM
2Sigmoid_136.(Sigmoid)/broadcast_store/ptq_new_st_0


€



j3
Conv_135(Conv)_load_data


€



j7
Conv_135(Conv)_load_weights

€
€

j.
Conv_135(Conv)/psum


€



j2
Conv_135(Conv)_load_act



€
j>
#Conv_135(Conv)_load_data/const_load



€
jC
(Conv_135(Conv)_load_weights/load_weights



€
jV
;Sigmoid_136.(Sigmoid)/broadcast_store/ptq_new_st/const_load



€
j:
Sigmoid_136.(Sigmoid)/broadcast


€



jM
2Sigmoid_136.(Sigmoid)/broadcast_store/ptq_new_st_0


€



j)
Conv_135(Conv)


€



