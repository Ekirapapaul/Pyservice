import schedule
import time
import logging

LOG_FILE_PATH = '/home/ekirapa/Paul/Logs/'

def get_logger():
    print 'started'
    logger = logging.getLogger('__name__')
    logger.setLevel(logging.INFO)
    hdlr = logging.FileHandler(LOG_FILE_PATH + 'scheduler.log')
    formatter = logging.Formatter('%(asctime)s %(levelname)s %(message)s')
    hdlr.setFormatter(formatter)
    logger.addHandler(hdlr)
    
    handler = logging.FileHandler(LOG_FILE_PATH + 'scheduler.log')
    handler.setLevel(logging.DEBUG)
    handler.setFormatter(formatter)
    logger.addHandler(handler)

    return logger

def schedule_job():
    """ job function """
    logger = get_logger()
    logger.info("Logging via schedule job")
	

#schedule.every(1).minutes.do(schedule_job)
schedule_job()

while True:
    schedule.run_pending()
    time.sleep(1)
   
