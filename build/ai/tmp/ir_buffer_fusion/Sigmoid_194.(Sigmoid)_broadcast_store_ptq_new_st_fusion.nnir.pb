	nncase ir1.7.1:?-
?
Concat_186(Concat)
!Conv_187(Conv)_load_data_deq_loadConv_187(Conv)_load_dataConv_187(Conv)_load_data"GNNELoad*
module_typeJk510*
actionJtrue
?
,Conv_187(Conv)_load_weights/weights_constant
(Conv_187(Conv)_load_weights/load_weightsConv_187(Conv)_load_weightsConv_187(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
aConv_187(Conv)/psumConv_187(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
u
Conv_187(Conv)/actConv_187(Conv)_load_actConv_187(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
?
"Conv_187(Conv)_load_data_deq_const!Conv_187(Conv)_load_data_deq_load!Conv_187(Conv)_load_data_deq_load"GNNELoad*
module_typeJk510*
actionJtrue
?
4Conv_187(Conv)_load_weights/weights_constant/ptq_deq(Conv_187(Conv)_load_weights/load_weights(Conv_187(Conv)_load_weights/load_weights"GNNELoad*
module_typeJk510*
actionJtrue
?
Conv_187(Conv)Sigmoid_188.(Sigmoid)/broadcastSigmoid_188.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
?
,Conv_190(Conv)_load_weights/weights_constant
(Conv_190(Conv)_load_weights/load_weightsConv_190(Conv)_load_weightsConv_190(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
aConv_190(Conv)/psumConv_190(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
u
Conv_190(Conv)/actConv_190(Conv)_load_actConv_190(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
?
4Conv_190(Conv)_load_weights/weights_constant/ptq_deq(Conv_190(Conv)_load_weights/load_weights(Conv_190(Conv)_load_weights/load_weights"GNNELoad*
module_typeJk510*
actionJtrue
?
Conv_190(Conv)Sigmoid_191.(Sigmoid)/broadcastSigmoid_191.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
?
,Conv_193(Conv)_load_weights/weights_constant
(Conv_193(Conv)_load_weights/load_weightsConv_193(Conv)_load_weightsConv_193(Conv)_load_weights"GNNELoad*
module_typeJk510*
actionJtrue
aConv_193(Conv)/psumConv_193(Conv)/psum"Uninitialized*
module_typeJstackvm*
actionJtrue
u
Conv_193(Conv)/actConv_193(Conv)_load_actConv_193(Conv)_load_act"GNNELoad*
module_typeJk510*
actionJtrue
?
4Conv_193(Conv)_load_weights/weights_constant/ptq_deq(Conv_193(Conv)_load_weights/load_weights(Conv_193(Conv)_load_weights/load_weights"GNNELoad*
module_typeJk510*
actionJtrue
?
ASigmoid_194.(Sigmoid)/broadcast_store/ptq_new_st/const_load/const;Sigmoid_194.(Sigmoid)/broadcast_store/ptq_new_st/const_load;Sigmoid_194.(Sigmoid)/broadcast_store/ptq_new_st/const_load"GNNELoad*
module_typeJk510*
actionJtrue
?
Conv_193(Conv)Sigmoid_194.(Sigmoid)/broadcastSigmoid_194.(Sigmoid)/broadcast"GNNEMNBroadcast*
module_typeJk510*
actionJtrue
?
Sigmoid_194.(Sigmoid)/broadcast
;Sigmoid_194.(Sigmoid)/broadcast_store/ptq_new_st/const_load2Sigmoid_194.(Sigmoid)/broadcast_store/ptq_new_st_00Sigmoid_194.(Sigmoid)/broadcast_store/ptq_new_st"	GNNEStore*
module_typeJk510*
actionJtrue
?
Conv_187(Conv)_load_data
Conv_187(Conv)_load_weights
Conv_187(Conv)/psum
Conv_187(Conv)_load_actConv_187(Conv)Conv_187(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue
?
Sigmoid_188.(Sigmoid)/broadcast
Conv_190(Conv)_load_weights
Conv_190(Conv)/psum
Conv_190(Conv)_load_actConv_190(Conv)Conv_190(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue
?
Sigmoid_191.(Sigmoid)/broadcast
Conv_193(Conv)_load_weights
Conv_193(Conv)/psum
Conv_193(Conv)_load_actConv_193(Conv)Conv_193(Conv)"
GNNEConv2D*
module_typeJk510*
actionJtrue7Sigmoid_194.(Sigmoid)/broadcast_store/ptq_new_st/fusionZ-
Concat_186(Concat)


?
(
(ZG
,Conv_187(Conv)_load_weights/weights_constant

@
?

Z,
Conv_187(Conv)/act



@
Z=
"Conv_187(Conv)_load_data_deq_const



?
ZN
4Conv_187(Conv)_load_weights/weights_constant/ptq_deq



@
ZF
,Conv_190(Conv)_load_weights/weights_constant

@
@

Z,
Conv_190(Conv)/act



@
ZN
4Conv_190(Conv)_load_weights/weights_constant/ptq_deq



@
ZF
,Conv_193(Conv)_load_weights/weights_constant

@
@

Z,
Conv_193(Conv)/act



@
ZN
4Conv_193(Conv)_load_weights/weights_constant/ptq_deq



@
Z[
ASigmoid_194.(Sigmoid)/broadcast_store/ptq_new_st/const_load/const



@
bL
2Sigmoid_194.(Sigmoid)/broadcast_store/ptq_new_st_0


@
(
(j3
Conv_187(Conv)_load_data


?
(
(j6
Conv_187(Conv)_load_weights

@
?

j-
Conv_187(Conv)/psum


@
(
(j1
Conv_187(Conv)_load_act



@
j<
!Conv_187(Conv)_load_data_deq_load



?
jB
(Conv_187(Conv)_load_weights/load_weights



@
j9
Sigmoid_188.(Sigmoid)/broadcast


@
(
(j5
Conv_190(Conv)_load_weights

@
@

j-
Conv_190(Conv)/psum


@
(
(j1
Conv_190(Conv)_load_act



@
jB
(Conv_190(Conv)_load_weights/load_weights



@
j9
Sigmoid_191.(Sigmoid)/broadcast


@
(
(j5
Conv_193(Conv)_load_weights

@
@

j-
Conv_193(Conv)/psum


@
(
(j1
Conv_193(Conv)_load_act



@
jB
(Conv_193(Conv)_load_weights/load_weights



@
jU
;Sigmoid_194.(Sigmoid)/broadcast_store/ptq_new_st/const_load



@
j9
Sigmoid_194.(Sigmoid)/broadcast


@
(
(jL
2Sigmoid_194.(Sigmoid)/broadcast_store/ptq_new_st_0


@
(
(j(
Conv_187(Conv)


@
(
(j(
Conv_190(Conv)


@
(
(j(
Conv_193(Conv)


@
(
(