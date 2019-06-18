import os
from setuptools import setup, find_packages

version = '0.0.1'

reqs = [
    'Flask >=1.0.3, <1.1',
    'PyYAML >=5.1.1, <6',
]

dev_requirements = [
    'nose',
    'flake8',
    'pep8',
    'autopep8',
    'coverage'
]


def read(f):
    return open(os.path.join(os.path.dirname(__file__), f)).read().strip()


setup(name='flask_seed',
      version=version,
      description=('Flask app seed'),
      long_description='\n\n'.join((read('README.md'))),
      classifiers=[
          'License :: OSI Approved :: BSD License',
          'Intended Audience :: Developers',
          'Programming Language :: Python'],
      author='Łukasz Jachym',
      author_email='lukasz <dot> jachym <at> gmail <dot> com',
      url='https://github.com/b1r3k/better-flask-seed',
      license='Apache',
      packages=find_packages(),
      install_requires = reqs,
      extras_require={
          'dev': dev_requirements
      },
      include_package_data = False)
