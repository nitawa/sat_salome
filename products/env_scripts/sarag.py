#!/usr/bin/env python
#-*- coding:utf-8 -*-

import os.path
import platform

def set_env(env, prereq_dir, version):
  env.set('SALOME_ASSISTANT_ROOT_DIR', prereq_dir)
  env.set('SALOME_ASSISTANT', os.path.join(prereq_dir, 'bin', 'salome-assistant.sh'))

def set_nativ_env(env):
  pass
