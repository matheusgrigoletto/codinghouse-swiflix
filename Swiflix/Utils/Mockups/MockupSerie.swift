//
//  MockupSerie.swift
//  Swiflix
//
//  Created by Erik Radicheski da Silva on 12/11/20.
//

import Foundation

struct MockupSerie {
    
    static func getSeries() -> [GenericMedia] {
        
        return  [
            GenericMedia(id: 0, title: "Cobra Kai",
                         rating: 8,
                         overview: "Esta sequência de Karate Kid pega 30 anos depois dos eventos do All Valley Karate Tournament de 1984 e encontra Johnny Lawrence em busca de redenção reabrindo o infame dojo de karate Cobra Kai . Isso reacende sua antiga rivalidade com o bem-sucedido Daniel LaRusso, que vem trabalhado para manter o equilíbrio em sua vida sem o seu mentor Miyagi.", poster: "/eTMMU2rKpZRbo9ERytyhwatwAjz.jpg"),
            GenericMedia(id: 0, title: "Fear the Walking Dead",
                         rating: 7.3,
                         overview: "Ambientada em Los Angeles, a série mostra o começo do apocalipse zumbi e a temível desintegração da sociedade pelos olhos de uma família disfuncional, que precisa se unir para tentar sobreviver ao caos do fim dos tempos.",
                         poster: "/tbgPaIEZa9BuKKESdyapOn0CZh6.jpg"),
            GenericMedia(id: 0, title: "The Boys",
                         rating: 8.4,
                         overview: "Na trama, conhecemos um mundo em que super-heróis são as maiores celebridades do planeta, e rotineiramente abusam dos seus poderes ao invés de os usarem para o bem.",
                         poster: "/dzOxNbbz1liFzHU1IPvdgUR647b.jpg"),
            GenericMedia(id: 0, title: "Lucifer",
                         rating: 8.5,
                         overview: "Entediado com a vida nas trevas, o diabo se muda para Los Angeles, abre um piano-bar e empresta sua sabedoria a uma investigadora de assassinatos.",
                         poster: "/vn4K3hgtoDV2rIK6FfYK8ejn1tW.jpg")
        ]
        
    }
    
    static func getOneSerie() -> Serie {
        
        return Serie(backdrop: "/mGVrXeIjyecj6TKmwPVpHlscEmw.jpg",
                     genres: [
                        Genres(id: 10765,
                               name: "Ficção científica e fantasia"),
                        Genres(id: 10759,
                               name: "Ação e aventura")],
                     homePage: "https://www.amazon.com/dp/B0875L45GK",
                     id: 76479,
                     originalTitle: "The Boys",
                     overview: "Na trama, conhecemos um mundo em que super-heróis são as maiores celebridades do planeta, e rotineiramente abusam dos seus poderes ao invés de os usarem para o bem.",
                     poster: "/dzOxNbbz1liFzHU1IPvdgUR647b.jpg",
                     releaseDate: "2019-07-25",
                     runtime: 60,
                     title: "The Boys",
                     vote: 8.4)
    }
    
    static func getEpiosdes() -> [SerieEpisode] {
        
        return [
            SerieEpisode(backdrop: "/83vFYTHtCqWwaDtZluSU8bmnFYG.jpg",
                         season: 1,
                         episode: 1,
                         title: "O Nome do Jogo",
                         releaseDate: "2019-07-25",
                         overview: "Quando um Super mata o amor de sua vida, o vendedor de aparelhos eletrônicos Hughie Campbell se une a Billy Bruto, um justiceiro decidido a punir os Super corruptos, e a vida de Hughie nunca mais será a mesma."),
            SerieEpisode(backdrop: "/1XzqWHBFvddrO2sazXzaCTtFEeA.jpg",
                         season: 1,
                         episode: 2,
                         title: "Cherry",
                         releaseDate: "2019-07-25",
                         overview: "Os Caras pegam um super-herói, Luz-Estrela se vinga, Capitão Pátria fica atrevido e um senador fica muito mais atrevidinho."),
            SerieEpisode(backdrop: "/mF7TK7LMbWhlLz1Q5M1662TiKvP.jpg",
                         season: 1,
                         episode: 3,
                         title: "Na Fissura",
                         releaseDate: "2019-07-25",
                         overview: "É a corrida do século. Trem-Bala contra Onda de Choque disputando o título de \"O Homem Mais Rápido do Mundo\". Enquanto isso, os Caras voltam a se reunir e estão se sentindo ótimos."),
            SerieEpisode(backdrop: "/iqdh1aITkP4BicsZmQLQ7MDMo1z.jpg",
                         season: 2,
                         episode: 1,
                         title: "Uma Viagem e Tanto",
                         releaseDate: "2020-09-04",
                         overview: "Agora com 50% mais cabeças explodindo, terroristas, prostitutas S&M, cultos e um novo cheirinho de pinho! Mas calma, tem mais! 2X MAIS sangue, vísceras e carnificina do que as outras marcas líderes!"),
            SerieEpisode(backdrop: "/m6LSiAimRiST07sC0vsUDITojT3.jpg",
                         season: 2,
                         episode: 2,
                         title: "Armando a Arapuca",
                         releaseDate: "2020-09-04",
                         overview: "Os caras arranjam um Super Terrorista, a Luz-Estrala consegue evidências contra a Vought, o Profundo descobre seus verdadeiros sentimentos e o Capitão Pátria consegue uma família (mais ou menos)."),
            SerieEpisode(backdrop: "/2ybNJwvpQrf6L4ym2V89xMCaHOI.jpg",
                         season: 2,
                         episode: 3,
                         title: "Mil Homens Armados Com Espadas",
                         releaseDate: "2020-09-04",
                         overview: "Atenção: Se você ou um ente querido foi exposto ao Composto V, pode ter direito a uma indenização. A Vought administrou a droga em várias vítimas sem o conhecimento delas. Se você acredita que você ou um ente querido receberam o Composto V, ligue para o escritório de advocacia Bremmer & Bremmer pelo número 1-888-177-2774 para obter uma consulta jurídica gratuita. Conheça seus direitos!")
        ]
        
    }
    
    static func getReviews() -> [Reviews] {
        
        return [
            Reviews(author: "YouShouldKnow",
                    content: "Wonderful premise, beautiful pictures, handsome, good and sexy actors, what could go wrong?\r\n\r\nUnnecessary, stupid decisions.\r\nEverywhere.\r\n\r\nThe typical \"say something!\" \\*stuttering and stammering* to introduce some side-story, or secret personas where the only thing to change is the hero's suit, or a wimpy protagonist who has way too many scenes of indecisiveness, long and drawn out dialogues (seriously 2x the speed and it's like things are normal again), extraneous lies to create drama, etc. etc. etc.\r\n\r\nIt's like a trope collection turned into a superhero series with a \"*gotcha!*\" twist. Seriously, the acting and the story is good, but the tropes kill every redeeming quality.\r\n\r\nIt's a tragedy"),
            Reviews(author: "Lenny_H",
                    content: "A great series set in a world where superheroes are a real phenomenon.\r\n\r\nCapitalism is omnipresent, profit and money are in everyone's mind.\r\nOf course the 'Sups' abuse their power for their own interests and many more cruel and immoral things.\r\nEvery hero's doing is explained, some more, some less. There's a perfect balance between big serious storylines and little kind of darker humor ones. \r\n\r\n'The Boys' are trying to destroy this whole system due to personal problems with some of the 'Sups'. The focus clearly is around them and what they're doing. \r\nSo it's definitely an Anti-Superhero show which look and topic reminds me of 'Watchmen' or some other more Noir candidates in this genre.\r\n\r\nThe whole series is explicit, which adds up really well. Without the violence and the handling with sexual situations the whole show wouldn't be that impressive and near to the reality. Not appropriate for younger viewers, if you ask me."),
            Reviews(author: "josalarcon2",
                    content: "For me the whole series is a total and effective satire that lets us see what would become of the world if fiction becomes reality: heroes lose interest in saving the world (or take advantage of its status), are forced to do things that are not right, to follow the company's own interests and do not go out to end the crime if they are not followed by a camera that captures each of their movements, even though they are always transmitting that image of exemplary citizen when in fact they are greedy and treat their fans badly.\r\n\r\nIt's also chilling to know that people in power act as judges and executioners to decide what crimes are profitable and what millions of dollars they rent their superheroes to other cities so they can be safe. The precision in the denunciation of The Boys is one of its strongest points since satire towards these characters is not new, but combining it with the theme of corporate America and wild capitalism gives it a clear differential touch.\r\n\r\nThe series is a total hit and is perfectly developed, to the point of making it impossible to miss because chapter by chapter the anguish increases. So if you have free time, I strongly recommend you to watch this satirical series.")
        ]
        
    }
    
}
