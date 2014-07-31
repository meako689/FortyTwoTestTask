import models
from datetime import datetime
import logging

logger = None


class PhonyLogger(object):

    def debug(self, *args, **kwargs):
        pass

    def info(self, *args, **kwargs):
        pass

    def warning(self, *args, **kwargs):
        pass

    def error(self, *args, **kwargs):
        pass

    def critical(self, *args, **kwargs):
        pass


class LoggingMiddleware(object):
    """
    Basic logging middleware. If settings.LOG_ENABLED is set, adds a logger
    instance as request.logger

    Logging can be used as:

        request.logger.[debug, info, warning, error and critical]

    Ex: request.logger.info("This is an info message")

    Requires LOG_ENABLED settings value.

    If settings.LOG_ENABLED is True, requires LOG_FILE value.

    LOG_NAME is optional, and will specify a name for this logger
    instance (not shown in default format string)
    """

    def process_request(self, request):
        from django.conf import settings
        enabled = getattr(settings, 'LOG_ENABLED', True)
        logfile = getattr(settings, 'LOG_FILE', None)
        if not enabled or not logfile:
            request.logger = PhonyLogger()
            return

        global logger
        if logger is None:
            logging.basicConfig(
                level=logging.DEBUG,
                format='%(asctime)s - %(levelname)s - %(message)s',
                datefmt='%Y-%m-%d %X',
                filename=settings.LOG_FILE,
                filemode='a')
            logger = logging.getLogger(getattr(settings, 'LOG_NAME', 'django'))
            logger.setLevel(logging.DEBUG)

        request.logger = logger


        models.WebRequest(
            log = logger
        ).save()