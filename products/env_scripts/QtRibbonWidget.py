#!/usr/bin/env python
#-*- coding:utf-8 -*-

import os.path
import platform

def set_env(env, prereq_dir, version):
    env.set('QtRibbonWidget_VERSION', version)
    env.set('QtRibbonWidget_ROOT_DIR', prereq_dir)
    env.set('QtRibbonWidget_DIR', os.path.join(prereq_dir,'lib','cmake'))
    env.prepend('LD_LIBRARY_PATH', os.path.join(prereq_dir, 'lib'))

def set_nativ_env(env):
    pass
