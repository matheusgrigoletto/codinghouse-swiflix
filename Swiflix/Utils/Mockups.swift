//
//  Mockups.swift
//  Swiflix
//
//  Created by Bryan Barreto on 27/10/20.
//

import Foundation


struct MockupMovie {
    static func getMovies() -> [GenericMedia]{
        let movies: [GenericMedia] = [
            GenericMedia(title: "Hard Kill", rating: 4, overview: "O trabalho do bilionário CEO de tecnologia Donovan Chalmers (Willis) é tão valioso que ele contrata mercenários para protegê-lo e um grupo terrorista sequestra sua filha apenas para obtê-lo.", poster: "/ugZW8ocsrfgI95pnQ7wrmKDxIe.jpg"),
            GenericMedia(title: "2067", rating: 5.5, overview: "Um grupo de humanos busca respostas no futuro após as florestas, vida selvagem e plantas do planeta serem devastados pela mudança climática.", poster: "/7D430eqZj8y3oVkLFfsWXGRcpEG.jpg"),
            GenericMedia(title: "Demon Slayer: O Trem Infinito", rating: 8, overview: "Tanjiro Kamado, junto com Inosuke Hashibira, um garoto criado por javalis que usa uma cabeça de javali, e Zenitsu Agatsuma, um garoto assustado que revela seu verdadeiro poder quando dorme, embarca no Trem Infinito em uma nova missão com o Hashira de Fogo, Kyojuro Rengoku, para derrotar um demônio que tem atormentado o povo e matado os caçadores de oni que se opõem a ele!", poster: "/m9cn5mhW519QKr1YGpGxNWi98VJ.jpg"),
            GenericMedia(title: "Enola Holmes", rating: 7.6, overview: "Enola Holmes só tem 16 anos, mas vai fazer de tudo para encontrar a mãe desaparecida, inclusive despistar o irmão Sherlock e ajudar um jovem lorde fugitivo.", poster: "/riYInlsq2kf1AWoGm80JQW5dLKp.jpg"),
        ]
        
        return movies
    }
    
    static func getFullMovie() -> FullMovie {
        let movie: FullMovie = FullMovie(backdrop: "/9DeGfFIqjph5CBFVQrD6wv9S7rR.jpg", genres: [Genres(id: 12, name: "Aventura"), Genres(id: 14, name: "Fantasia"), Genres(id: 28, name: "Ação")], homePage: "http://www.lordoftherings.net", id: 122, originalTitle: "The Lord of the Rings: The Return of the King", overview: "O confronto final entre as forças do bem e do mal que lutam pelo controle do futuro da Terra Média se aproxima. Sauron planeja um grande ataque a Minas Tirith, capital de Gondor, o que faz com que Gandalf e Pippin partam para o local na intenção de ajudar a resistência. Um exército é reunido por Theoden em Rohan, em mais uma tentativa de deter as forças de Sauron. Enquanto isso, Frodo, Sam e Gollum seguem sua viagem rumo à Montanha da Perdição para destruir o anel.", poster: "/izPNMzffsgZUvlbiYlPxjFr3TAa.jpg", releaseDate: "2003-12-01", runtime: 201, title: "O Senhor dos Anéis: O Retorno do Rei", vote: 8.5)
        return movie
    }
    
    static func getReviews() -> [Reviews] {
        let reviews: [Reviews] = [
            Reviews(author: "Filipe Manuel Dias Neto", content: "**O fim de uma obra-prima**\r\n\r\nEste filme marca o fim da trilogia \"O Senhor dos Anéis\", baseada no romance épico de J.R.R. Tolkien. Como nos outros dois filmes, manteve o mesmo elenco e equipa. Neste filme, o enredo chega ao fim com a chegada de Sam e Frodo a Mordor. Mas não podemos analisar este filme com justiça se olharmos para ele sem considerar os dois que o precederam. \r\n\r\nA trilogia conseguiu manter o sentido de unidade e de coesão do início ao fim. Na prática, funciona como um filme único, com cerca de onze horas de duração e em três partes. Por isso, falar de apenas um é falar sobre os três da mesma maneira que para entender a acção é necessário ver primeiro os dois filmes que o precederam. E se os dois filmes anteriores deleitaram o público com cenas incríveis, este filme vai continuar esse trabalho. E não estou só a falar das grandiosas batalhas, como o Cerco a Minas Tirith, ou das várias cenas de acção, mas também das paisagens maravilhosas da Nova Zelândia, onde muitas das cenas ao ar livre foram filmadas. O uso de recursos tecnológicos e CGI permitiu cenas que parecem realmente impossíveis, como a sequência de luta na Porta Negra e o colapso da torre de Barad Dur. A maquilhagem e a caracterização também merecem uma nota especial de mérito pelo cuidado especial que tiveram. Para provar isso basta estar atento aos pés dos hobbits ou aos ouvidos dos elfos.\r\n\r\nTensão, mistério, suspense e adrenalina correm do início ao fim e mantêm a audiência, que segue as personagens na sua luta contra o mal. O elenco é impecável, as performances foram excelentes e a banda sonora tornou-se icónica, ajudando a consagrar Howard Shore como um dos maiores nomes da música de cinema dos nossos dias.")
        ]
        return reviews
    }
    
    static func getTraillers() -> [MovieTrailler] {
        let traillers: [MovieTrailler] = [
            MovieTrailler(name: "Convenção das Bruxas - Trailer Legendado (Versão EUA)", key: "8CtPa7wt07Q", site: "YouTube", type: "Trailer"),
            MovieTrailler(name: "Convenção das Bruxas - Trailer Dublado", key: "8TQLGcnJ3mc", site: "YouTube", type: "Trailer"),
            MovieTrailler(name: "Convenção das Bruxas - Trailer Legendado", key: "SvIhmRaCkYY", site: "YouTube", type: "Trailer"),
        ]
        return traillers
    }
 
}

struct MockupSerie {
    static func getSeries() -> [GenericMedia] {
        
        let series: [GenericMedia] = [
            GenericMedia(title: "Cobra Kai", rating: 8, overview: "Esta sequência de Karate Kid pega 30 anos depois dos eventos do All Valley Karate Tournament de 1984 e encontra Johnny Lawrence em busca de redenção reabrindo o infame dojo de karate Cobra Kai . Isso reacende sua antiga rivalidade com o bem-sucedido Daniel LaRusso, que vem trabalhado para manter o equilíbrio em sua vida sem o seu mentor Miyagi.", poster: "/eTMMU2rKpZRbo9ERytyhwatwAjz.jpg"),
            GenericMedia(title: "Fear the Walking Dead", rating: 7.3, overview: "Ambientada em Los Angeles, a série mostra o começo do apocalipse zumbi e a temível desintegração da sociedade pelos olhos de uma família disfuncional, que precisa se unir para tentar sobreviver ao caos do fim dos tempos.", poster: "/tbgPaIEZa9BuKKESdyapOn0CZh6.jpg"),
            GenericMedia(title: "The Boys", rating: 8.4, overview: "Na trama, conhecemos um mundo em que super-heróis são as maiores celebridades do planeta, e rotineiramente abusam dos seus poderes ao invés de os usarem para o bem.", poster: "/dzOxNbbz1liFzHU1IPvdgUR647b.jpg"),
            GenericMedia(title: "Lucifer", rating: 8.5, overview: "Entediado com a vida nas trevas, o diabo se muda para Los Angeles, abre um piano-bar e empresta sua sabedoria a uma investigadora de assassinatos.", poster: "/vn4K3hgtoDV2rIK6FfYK8ejn1tW.jpg"),
        ]
        
        return series
    }
 
}

struct MockupPerson {
    static func getPeople() -> [Person] {
        let people: [Person] = [
            Person(name: "Scarlett Johansson", profile: "/6NsMbJXRlDZuDzatN2akFdGuTvx.jpg", department: "Acting", knownFor: ["Os Vingadores: The Avengers","Vingadores: Guerra Infinita","Capitão América: Guerra Civil"]),
            Person(name: "Dwayne Johnson", profile: "/cgoy7t5Ve075naBPcewZrc08qGw.jpg", department: "Acting", knownFor: ["Jumanji: Bem-Vindo à Selva","Moana: Um Mar de Aventuras","Velozes e Furiosos 6"]),
            Person(name: "Jason Statham", profile: "/lldeQ91GwIVff43JBrpdbAAeYWj.jpg", department: "Acting", knownFor: ["Velozes e Furiosos 6","Velozes & Furiosos 7","Velozes e Furiosos 8"]),
            Person(name: "Anne Hathaway", profile: "/tLelKoPNiyJCSEtQTz1FGv4TLGc.jpg", department: "Acting", knownFor: ["Interestelar","Batman: O Cavaleiro das Trevas Ressurge","Alice no País das Maravilhas"]),
        ]
        
        return people
    }
}

struct MockupInitialViewControllerBackgroundImage {
    static func getBackgroundImages() -> [String] {
        let backgroundImages:[String] = [
            "/ucMdbTpOhV75R0NtxqHEg4hirNl.jpg",
            "/6zBWSuYW3Ps1nTfeMS8siS4KUaA.jpg",
            "/9fSGtPOp3MlFfynLEjYjlOfenbk.jpg",
            "/cfhfcEt4bOXuVZkTC0nNBpqqiWb.jpg",
            "/dzOxNbbz1liFzHU1IPvdgUR647b.jpg",
            "/6CoRTJTmijhBLJTUNoVSUNxZMEI.jpg",
            "/uOw5JD8IlD546feZ6oxbIjvN66P.jpg",
            "/eHFJ15cZ1pfk60XTcTl9GYxnhf6.jpg",
            "/riYInlsq2kf1AWoGm80JQW5dLKp.jpg",
            "/m9cn5mhW519QKr1YGpGxNWi98VJ.jpg",
        ]
        return backgroundImages
    }
}

struct MockupFullPerson {
    static func getFullPerson() -> FullPerson {
        let fullPerson: FullPerson = FullPerson(birthday: "1984-11-22", deathday: nil, name: "Scarlett Johansson", biography: "Scarlett Ingrid Johansson (Nova Iorque, 22 de novembro de 1984), mais conhecida como Scarlett Johansson, é uma atriz, cantora e modelo americana de ascendência dinamarquesa e polonesa. Ela fez sua estréia no cinema em North (1994) e mais tarde foi nomeada para o Independent Spirit Award de Melhor Atriz por sua atuação em Manny &amp; Lo (1996), ganhando ainda mais elogios e destaque com papéis em The Horse Whisperer (1998) e Ghost World (2001). Ela mudou para papéis adultos com suas performances em Girl with a Pearl Earring (2003) e Lost in Translation (2003) de Sofia Coppola, pelo qual ela ganhou um prêmio BAFTA de Melhor Atriz em um papel principal; ambos os filmes lhe renderam indicações ao Globo de Ouro.\n\nUm papel em A Love Song for Bobby Long (2004) fez com que Johansson ganhasse sua terceira nomeação ao Globo de Ouro de Melhor Atriz. Johansson ganhou outra indicação ao Globo de Ouro de Melhor Atriz Coadjuvante com seu papel em Match Point, de Woody Allen (2005). Ela passou a estrelar mais dois filmes de Allen: Scoop (2006) e Vicky Cristina Barcelona (2008). Johansson apareceu em outros filmes de sucesso, como The Prestige de Christopher Nolan (2006), o drama histórico The Other Boleyn Girl (2008) e a comédia romântica conjunta He's Just Not That Into You (2009). Ela intepretou a personagem Viúva Negra/Natalia Romanova/Natasha Romanoff da Marvel em Iron Man 2 (2010), Os Vingadores (2012) e em Capitão América: O Soldado Invernal (2014), ela ainda reprisou o papel de Viúva Negra em Os Vingadores 2 (2015) e ainda em Capitão América 3: Guerra Civil.\n\nO renascimento da peça na Broadway de Arthur Miller A View From the Bridge de 2010 fez com que ganhasse o Tony Award de Melhor Atriz Coadjuvante em Peça. Como cantora, Johansson lançou dois álbuns, Anywhere I Lay My Head e Break Up. Em 2 de maio de 2012, ela foi homenageada com uma estrela no Hollywood Walk of Fame, que foi colocado na frente de Madame Tussauds Hollywood, em Hollywood Boulevard.\n\nJohansson também é considerada um dos símbolos sexuais femininos modernos de Hollywood, e aparece com frequência nas listas publicadas das mulheres mais sexy do mundo, principalmente quando foi nomeada a \"Mulher Mais Sexy Viva\" pela revista Esquire em 2006 e 2013 (a única mulher a ser escolhida para o título duas vezes), e o \"Sexiest Celebrity\", de Playboy, em 2007. A partir de julho de 2016, ela é a atriz de maior bilheteria de todos os tempos na América do Norte, e décima primeira pessoa em geral, com seus filmes fazendo mais de 3,3 bilhões de dólares.[10] A maior parte de seu sucesso de bilheteria é atribuído a seu papel de Viúva Negra no Universo Cinematográfico Marvel.\n\nFonte: Wikipédia", place_of_birth: "New York City, New York, USA", profile_path: "/6NsMbJXRlDZuDzatN2akFdGuTvx.jpg", known_for_department: "Acting")
        
        return fullPerson
    }
}

struct MockupPhoto {
    static func getPhotos() -> [PersonPhotoGallery] {
        let photos:[PersonPhotoGallery] = [
            PersonPhotoGallery(file_path: "/gxnBaEaCNShBiQXRNICsljONIAO.jpg"),
            PersonPhotoGallery(file_path: "/ntpIIUsNSdh7AAg6LxVzIxTRoRZ.jpg"),
            PersonPhotoGallery(file_path: "/rzjSlH8UIRtMCz5PLG4sRw1QBCT.jpg"),
            PersonPhotoGallery(file_path: "/84O4czhgWodsdrwy6FPap68EF7n.jpg"),
            PersonPhotoGallery(file_path: "/oqvusJfmH4zN2LgdCjmB2TxetOd.jpg"),
            PersonPhotoGallery(file_path: "/iGL2VOdKUJDmaby4JzGktGHrJJD.jpg"),
            PersonPhotoGallery(file_path: "/opEemSnjnN4hbwymHz5P0VVuk4F.jpg"),
            PersonPhotoGallery(file_path: "/6NsMbJXRlDZuDzatN2akFdGuTvx.jpg"),
            PersonPhotoGallery(file_path: "/mODcczqQyKuphfFAoBZGhxgnNfs.jpg"),
            PersonPhotoGallery(file_path: "/1h5klWQXY8utNQo1Wqn5WWk0JTC.jpg"),
            PersonPhotoGallery(file_path: "/pUYkuIhXQWjMTDVejs2aN48nq7L.jpg"),
            PersonPhotoGallery(file_path: "/mZIqWTnNaJv0ggeppfj6bpYhy2M.jpg"),
            PersonPhotoGallery(file_path: "/5g2n6ru6g30YF3EJb8o69rH0htc.jpg"),
            PersonPhotoGallery(file_path: "/q0bc7eOI1f9qrI3cjYLFxxRC723.jpg"),
            PersonPhotoGallery(file_path: "/zHPkXk66ucTVtSij8lVJKg21LLs.jpg"),
            PersonPhotoGallery(file_path: "/3JTEc2tGUact9c0WktvpeJ9pajn.jpg"),
        ]
        
        return photos
    }
}
