import schedule
import time
import logging

LOG_FILE_PATH = '/home/ekirapa/Paul/Logs'

def get_logger():
    print 'started'
    logger = logging.getLogger('script')
    hdlr = logging.FileHandler(LOG_FILE_PATH + 'scheduler.log')
    formatter = logging.Formatter('%(asctime)s %(levelname)s %(message)s')
    hdlr.setFormatter(formatter)
    logger.addHandler(hdlr)

    return logger

def schedule_job():
    """ job function """
    logging.basicConfig(filename='scheduler.log', level=logging.DEBUG)
    logging.debug('Logging service running')
    logging.info('Message printed from scheduler job')

schedule.every(1).minutes.do(schedule_job)

while True:
    schedule.run_pending()
    time.sleep(1)
    