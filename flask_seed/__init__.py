import argparse

from flask import Flask

from .bootstrap import get_config


def get_args():
    parser = argparse.ArgumentParser(formatter_class=argparse.ArgumentDefaultsHelpFormatter)
    parser.add_argument('--config-path', metavar='CONFIG_PATH', default='etc/local.yml', help='Path config')
    args, _ = parser.parse_known_args()
    return args


config = get_config(get_args)
app = Flask(__name__)


@app.route('/')
def hello_world():
    return 'Hello, World!'
