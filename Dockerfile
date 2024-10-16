FROM postgres:16.4-bookworm AS base

COPY ./seed ./seed
COPY ./tables ./tables
COPY ./procedures ./procedures
COPY ./init.sh ./docker-entrypoint-initdb.d