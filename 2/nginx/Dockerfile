FROM nginx

RUN rm -rf /etc/nginx/
COPY nginx-confs/ /etc/nginx/

RUN mkdir /opt/static
COPY static /opt/static

ENV CONFIG_MODE production


