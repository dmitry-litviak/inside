<div class="about-certifitations">
        <p>Brainbench является одним из самых популярных тестов. Hа должность Senior developer необходимо сдать один из тестов по своей специальности с результатом не менее <strong>4.00</strong>. Сдавать тест можно не чаще чем раз в 3 месяца. Компания оплачивает как покупку теста, так и почтовую доставку.</p>
        <h3>Brainbench</h3>
        <table class="table table-bordered table-striped" >
                <tbody>
                    <?php foreach ($certificates as $key => $certificate): ?>
                        <?php if (!empty($certificate)): ?>
                            <th colspan="2" style="text-align: center"><?php echo $key ?></th>
                        <?php endif; ?>
                        <?php foreach ($certificate as $value): ?>
                            <tr>
                                    <td><?php echo $value['first_name'] . ' ' . $value['last_name'] ?></td>
                                    <td><?php echo $value['score'] ?></td>
                            </tr>
                        <?php endforeach; ?>
                    <?php endforeach; ?>
                </tbody>
        </table>
</div>