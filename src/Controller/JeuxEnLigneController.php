<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class JeuxEnLigneController extends AbstractController
{
    #[Route('/jeux/en/ligne', name: 'jeux_en_ligne')]
    public function index(): Response
    {
        return $this->render('jeux_en_ligne/index.html.twig', [
            'controller_name' => 'JeuxEnLigneController',
        ]);
    }

    #[Route('/')]
    public function home() {
        return $this->render('jeux_en_ligne/home.html.twig', [
            'content' => "Bienvenue!"
        ]);
    }

    #[Route('/new')]
    public function new() {
        return $this->render('jeux_en_ligne/new.html.twig', [
            'content' => "Future page de création de jeux"
        ]);
        
    }

    #[Route('/games')]
    public function games() {
        return $this->render('jeux_en_ligne/games.html.twig', [
            'content' => "Future page de classement des jeux"
        ]);
    }
}
