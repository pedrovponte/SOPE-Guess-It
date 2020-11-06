# coding: utf-8
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import CheckConstraint, Column, Date, ForeignKey, Integer, String, UniqueConstraint, text
from sqlalchemy.orm import relationship
from sqlalchemy.sql.sqltypes import NullType
from sqlalchemy.ext.declarative import declarative_base

db = SQLAlchemy()
Base = declarative_base()
metadata = Base.metadata

class AdminCode(db.Model, Base):
    __tablename__ = 'AdminCode'

    code = Column(Integer, primary_key=True)


class Schedule(db.Model, Base):
    __tablename__ = 'Schedule'
    __table_args__ = (
        CheckConstraint("dateHour IS strftime('%Y-%m-%d %H:%M', dateHour)"),
    )

    id = Column(Integer, primary_key=True)
    dateHour = Column(String(50), nullable=False)
    duration = Column(Integer, nullable=False, server_default=text("10"))


class GuessItSession(db.Model, Base):
    __tablename__ = 'GuessItSession'

    id = Column(Integer, primary_key=True)
    schedule = Column(ForeignKey('Schedule.id'), nullable=False)

    Schedule = relationship('Schedule')


class GameRound(db.Model, Base):
    __tablename__ = 'GameRound'

    id = Column(Integer, primary_key=True)
    time = Column(Integer, nullable=False)
    points = Column(Integer, server_default=text("0"))
    word = Column(String(50), nullable=False)
    guessItSession = Column(ForeignKey('GuessItSession.id'), nullable=False)

    GuessItSession = relationship('GuessItSession')


class Definition(db.Model, Base):
    __tablename__ = 'Definitions'
    __table_args__ = (
        UniqueConstraint('definition', 'gameRound'),
    )

    id = Column(Integer, primary_key=True)
    definition = Column(String(100))
    gameRound = Column(ForeignKey('GameRound.id'), nullable=False)

    GameRound = relationship('GameRound')