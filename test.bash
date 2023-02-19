#!/bin/bash
# SPDX-FileCopyrightText: 2023 masasao　　　　　
# SPDX-License-Identifier: BSD-3-Clause

ng () {
	echo NG at Line $1
	res=1
}

res=0


out=$(./menseki 3 4 5)
[ "${out}" = 10.0 ] || ng ${LINENO}

out=$(./menseki 4 4 5)
[ "${out}" = 20.0 ] || ng ${LINENO}

out=$(./menseki)
[ "$?" = 1 ]     || ng ${LINENO}
[ "${out}" = [[何の計算を行うか指定されていません]] ] || ng ${LINENO}

out=$(./menseki 3 4 )
[ "$?" = 1 ]     || ng ${LINENO}
[ "${out}" = [[空欄があるため実行できません]] ] || ng ${LINENO}

out=$(./menseki 3 4 e)
[ "$?" = 1 ]     || ng ${LINENO}
[ "${out}" = [[整数か少数を入力してください]] ] || ng ${LINENO}

out=$(./menseki 5 3 4)
[ "$?" = 1 ]     || ng ${LINENO}
[ "${out}" = [[正しく実行できませんでした。説明をもう一度読んでください。]] ] || ng ${LINENO}



[ "$res" = 0 ] && echo OK
exit $res
