package com.retokarate.runners;
import com.intuit.karate.junit5.Karate;

public class GestionUsuariosRunner {
    @Karate.Test
    Karate testReqRes() {
        return Karate.run("src\\test\\java\\com\\retokarate\\features\\gestionusuarios.feature");
}

}