#!/bin/sh
skip=14
tmpdir=`/bin/mktemp -d ${TMPDIR:-/tmp}/gzexe.XXXXXXXXXX` || exit 1
prog="${tmpdir}/`echo \"$0\" | sed 's|^.*/||'`"
if /usr/bin/tail -n +$skip "$0" | "/bin"/gzip -cd > "$prog"; then
  /bin/chmod 700 "$prog"
  trap '/bin/rm -rf $tmpdir; exit $res' EXIT
  "$prog" ${1+"$@"}; res=$?
else
  echo "Cannot decompress $0"
  /bin/rm -rf $tmpdir
  exit 1
fi; exit $res
��!�Stool.sh ��o�0���xc�P)v)�V=��v٤�v��T�؀E[�C��l���vh�v�/�����y�_l޿�S�d�`!��GpK�e*a�6��x���I�<�M�qP��xz:p��:�CƝ�AB�)q�S7�'J��O`�3>�58YHg��E���U�ŜG��F�I�l��6F��ٰ�9Ԇ杒���K�NBF<��6 ��8���k�~�{P�~�K)��5�l�#MG � ˲� MK1U�q�q\q���:g=�H�	`%"�&j�x'���:yn�F�X@�@ "2m���If�)je�����5����qd�Xp8��O�������z3����Na&��^�0����w_h��%`�#[}y�&k�#�)��C"%FX
�I~�uT��Aͧ��}�Ɣ�O�^'ZR��!ٜi�'uZ�K���b˒J�4Qh��u�/�O�O�����LX(	KL�Iv1�"NG�a}�B����ê��_u��[�������~X�/5����8�_�oW�B.�X$V,?�#?aj�T�N�:<���g���<^".�m�{�\��w����l������x��yT����ZZSa6��\#����d�6E1��q�t�%��A�}�R�F��A�L�V��O��J6Ŧ��Y��Wͧ����>8��YqS��[hjN	M!S\3(����\��X�����v�-8N�â65�9�Å�P����.\�ȍG���[xv���/B�)7�Toa���L,!��D��*<  