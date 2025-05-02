<!DOCTYPE html>
<html lang="it">
    <head>
        <meta charset="UTF-8">
        <title>Sito Commerciale</title>
        <link rel="stylesheet" type="text/css" href="style_index.css">
    </head>
    <body>
        <?php include 'header.html'; ?>

        <div id="table_img_contenitore">
            <?php
                $connessione = new mysqli("127.0.0.1", "root", "", "DbSitoVetrina");

                if ($connessione->connect_error) {
                    die("Connessione fallita: " . $connessione->connect_error);
                }

                $sezioni = ['top', 'trending', 'bottom'];

                foreach ($sezioni as $sezione) {
                    $stmt = $connessione->prepare("SELECT nome, media FROM prodotti WHERE sezione = ? ORDER BY ordine_visualizzazione DESC LIMIT 4");
                    
                    if ($stmt === false) {
                        die("Errore nella preparazione della query.");
                    }

                    $stmt->bind_param("s", $sezione);
                    $stmt->execute();
                    $result = $stmt->get_result();

                    if ($result->num_rows > 0) {
                        echo "<div class='blocco_$sezione'>";
                        while ($row = $result->fetch_assoc()) {
                            echo "<div class='prodotto'>";
                            
                            if (isset($row['media']) && !empty($row['media'])) {
                                $filePath = 'uploads/' . basename($row['media']);

                                if (preg_match('/\.(mp4|webm|ogg)$/i', $filePath)) {
                                    echo '<a href="#"><video id="video_top" width="100%" height= auto autoplay muted loop>';
                                    echo '<source src="' . $filePath . '" type="video/mp4">';
                                    echo 'Il tuo browser non supporta il tag video.';
                                    echo '</video></a>';
                                } else {
                                    echo '<a id="link_img">';
                                    echo "<a href='#'><img src='" . $filePath . "' alt='" . $row['nome'] . "'></a>";
                                    echo '</a>';
                                }
                            } else {
                                echo "<p>Immagine o video non disponibile.</p>";
                            }
                        
                            echo "<div class='overlay-info'>";
                            echo "<h4>" . $row['nome'] . "</h4>";
                            /*echo "<button onclick=\"alert('Aggiunto al carrello: " . $row['nome'] . "')\">Acquista</button>";*/
                            echo "<a href='#'><button>Acquista</button></a>";
                            echo "</div>";
                            echo "</div>";
                        }
                        echo "</div>";
                    } else {
                        echo "<p>Non ci sono prodotti disponibili per la sezione $sezione.</p>";
                    }

                    $stmt->close();
                }

                $connessione->close();
            ?>
        </div>

        <?php include 'footer.html'; ?>
    </body>
</html>