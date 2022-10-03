	nncase ir1.7.1:ž
Á
7Sigmoid_130.(Sigmoid)/broadcast_store/ptq_new_st/fusion
#Conv_132(Conv)_load_data/const_loadConv_132(Conv)_load_dataConv_132(Conv)_load_data"GNNELoad*
module_typeJk510*
actionJtrue
Á
,Conv_132(Conv)_load_weights/weights_constant
(Conv_132(Conv)_load_weights/load_weightsConv_132(Conv)_load_weightsConv_132(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
u
Conv_132(Conv)/actConv_132(Conv)_load_actConv_132(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
¤
)Conv_132(Conv)_load_data/const_load/const#Conv_132(Conv)_load_data/const_load#Conv_132(Conv)_load_data/const_load"GNNELoad*
module_typeJk510*
actionJtrue
¹
4Conv_132(Conv)_load_weights/weights_constant/ptq_deq(Conv_132(Conv)_load_weights/load_weights(Conv_132(Conv)_load_weights/load_weights"GNNELoad*
module_typeJk510*
actionJtrue
ì
ASigmoid_133.(Sigmoid)/broadcast_store/ptq_new_st/const_load/const;Sigmoid_133.(Sigmoid)/broadcast_store/ptq_new_st/const_load;Sigmoid_133.(Sigmoid)/broadcast_store/ptq_new_st/const_load"GNNELoad*
module_typeJk510*
actionJtrue
aConv_132(Conv)/psumConv_132(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
ˆ
Conv_132(Conv)Sigmoid_133.(Sigmoid)/broadcastSigmoid_133.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
ô
Sigmoid_133.(Sigmoid)/broadcast
;Sigmoid_133.(Sigmoid)/broadcast_store/ptq_new_st/const_load2Sigmoid_133.(Sigmoid)/broadcast_store/ptq_new_st_00Sigmoid_133.(Sigmoid)/broadcast_store/ptq_new_st"	GNNEStore*
module_typeJk510*
actionJtrue
¶
Conv_132(Conv)_load_data
Conv_132(Conv)_load_weights
Conv_132(Conv)/psum
Conv_132(Conv)_load_actConv_132(Conv)Conv_132(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue7Sigmoid_133.(Sigmoid)/broadcast_store/ptq_new_st/fusionZR
7Sigmoid_130.(Sigmoid)/broadcast_store/ptq_new_st/fusion


€

ZH
,Conv_132(Conv)_load_weights/weights_constant

€
€

Z-
Conv_132(Conv)/act



€
ZD
)Conv_132(Conv)_load_data/const_load/const



€
ZO
4Conv_132(Conv)_load_weights/weights_constant/ptq_deq



€
Z\
ASigmoid_133.(Sigmoid)/broadcast_store/ptq_new_st/const_load/const



€
bM
2Sigmoid_133.(Sigmoid)/broadcast_store/ptq_new_st_0


€



j3
Conv_132(Conv)_load_data


€

j7
Conv_132(Conv)_load_weights

€
€

j2
Conv_132(Conv)_load_act



€
j>
#Conv_132(Conv)_load_data/const_load



€
jC
(Conv_132(Conv)_load_weights/load_weights



€
jV
;Sigmoid_133.(Sigmoid)/broadcast_store/ptq_new_st/const_load



€
j.
Conv_132(Conv)/psum


€



j:
Sigmoid_133.(Sigmoid)/broadcast


€



jM
2Sigmoid_133.(Sigmoid)/broadcast_store/ptq_new_st_0


€



j)
Conv_132(Conv)


€



