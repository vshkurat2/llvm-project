; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=i686-unknown-unknown -mattr=+avx512fp16 -mattr=+avx512vl -O3 | FileCheck %s --check-prefixes=CHECK
; RUN: llc < %s -mtriple=x86_64-unknown-unknown -mattr=+avx512fp16 -mattr=+avx512vl -O3 | FileCheck %s --check-prefixes=CHECK

declare <8 x half> @llvm.experimental.constrained.fadd.v8f16(<8 x half>, <8 x half>, metadata, metadata)
declare <8 x half> @llvm.experimental.constrained.fsub.v8f16(<8 x half>, <8 x half>, metadata, metadata)
declare <8 x half> @llvm.experimental.constrained.fmul.v8f16(<8 x half>, <8 x half>, metadata, metadata)
declare <8 x half> @llvm.experimental.constrained.fdiv.v8f16(<8 x half>, <8 x half>, metadata, metadata)

define <8 x half> @f2(<8 x half> %a, <8 x half> %b) #0 {
; CHECK-LABEL: f2:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vaddph %xmm1, %xmm0, %xmm0
; CHECK-NEXT:    ret{{[l|q]}}
  %ret = call <8 x half> @llvm.experimental.constrained.fadd.v8f16(<8 x half> %a, <8 x half> %b,
                                                                   metadata !"round.dynamic",
                                                                   metadata !"fpexcept.strict") #0
  ret <8 x half> %ret
}

define <8 x half> @f4(<8 x half> %a, <8 x half> %b) #0 {
; CHECK-LABEL: f4:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vsubph %xmm1, %xmm0, %xmm0
; CHECK-NEXT:    ret{{[l|q]}}
  %ret = call <8 x half> @llvm.experimental.constrained.fsub.v8f16(<8 x half> %a, <8 x half> %b,
                                                                   metadata !"round.dynamic",
                                                                   metadata !"fpexcept.strict") #0
  ret <8 x half> %ret
}

define <8 x half> @f6(<8 x half> %a, <8 x half> %b) #0 {
; CHECK-LABEL: f6:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vmulph %xmm1, %xmm0, %xmm0
; CHECK-NEXT:    ret{{[l|q]}}
  %ret = call <8 x half> @llvm.experimental.constrained.fmul.v8f16(<8 x half> %a, <8 x half> %b,
                                                                   metadata !"round.dynamic",
                                                                   metadata !"fpexcept.strict") #0
  ret <8 x half> %ret
}

define <8 x half> @f8(<8 x half> %a, <8 x half> %b) #0 {
; CHECK-LABEL: f8:
; CHECK:       # %bb.0:
; CHECK-NEXT:    vdivph %xmm1, %xmm0, %xmm0
; CHECK-NEXT:    ret{{[l|q]}}
  %ret = call <8 x half> @llvm.experimental.constrained.fdiv.v8f16(<8 x half> %a, <8 x half> %b,
                                                                   metadata !"round.dynamic",
                                                                   metadata !"fpexcept.strict") #0
  ret <8 x half> %ret
}

attributes #0 = { strictfp }