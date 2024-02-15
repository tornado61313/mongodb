FROM mongo

COPY ./init_db/data/ .
COPY ./init_db/seed.sh .

RUN chmod +x seed.sh
CMD ["sh", "-c", "/seed.sh"]
