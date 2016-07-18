; ModuleID = 'signed_f-sanit.bc'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [2 x i8] c"a\00", align 1
@.src = private unnamed_addr constant [9 x i8] c"signed.c\00", align 1
@0 = private unnamed_addr constant { i16, i16, [7 x i8] } { i16 0, i16 13, [7 x i8] c"'long'\00" }
@1 = private unnamed_addr constant { i16, i16, [6 x i8] } { i16 0, i16 11, [6 x i8] c"'int'\00" }
@2 = private unnamed_addr global { { [9 x i8]*, i32, i32 }, { i16, i16, [7 x i8] }*, { i16, i16, [6 x i8] }* } { { [9 x i8]*, i32, i32 } { [9 x i8]* @.src, i32 8, i32 10 }, { i16, i16, [7 x i8] }* @0, { i16, i16, [6 x i8] }* @1 }
@.str.1 = private unnamed_addr constant [8 x i8] c"c: %d \0A\00", align 1

; Function Attrs: nounwind uwtable
define i32 @main() #0 {
entry:
  %retval = alloca i32, align 4
  %a = alloca i64, align 8
  %c = alloca i32, align 4
  store i32 0, i32* %retval, align 4
  store i64 9223372036854775807, i64* %a, align 8
  %0 = bitcast i64* %a to i8*
  call void @klee_make_symbolic(i8* %0, i64 8, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str, i32 0, i32 0))
  %1 = load i64, i64* %a, align 8
  %2 = icmp sle i64 %1, 2147483647
  %3 = icmp sge i64 %1, -2147483648
  %and = and i1 %3, %2
  br i1 %and, label %cont, label %handler.truncation, !prof !1

handler.truncation:                               ; preds = %entry
  call void @__ubsan_handle_truncation(i8* bitcast ({ { [9 x i8]*, i32, i32 }, { i16, i16, [7 x i8] }*, { i16, i16, [6 x i8] }* }* @2 to i8*), i64 %1) #3
  br label %cont

cont:                                             ; preds = %handler.truncation, %entry
  %conv = trunc i64 %1 to i32
  store i32 %conv, i32* %c, align 4
  %4 = load i32, i32* %c, align 4
  %call = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.1, i32 0, i32 0), i32 %4)
  ret i32 0
}

declare void @klee_make_symbolic(i8*, i64, i8*) #1

; Function Attrs: uwtable
declare void @__ubsan_handle_truncation(i8*, i64) #2

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { uwtable }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 3.8.0 (tags/RELEASE_380/final)"}
!1 = !{!"branch_weights", i32 1048575, i32 1}
